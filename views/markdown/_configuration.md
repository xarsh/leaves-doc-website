# Configuration

## Configuration files

A lot of options in leaves can be configured. The configuration can be
global, project based, or local (ignored by git).

Configuration is stored in the following files:

* global: `$HOME/.leaves/config`
* project: `PROJECT/.leavesrc`
* local: `PROJECT/.leavesrc.local`

The files are in JSON format and can be edited by hand,
or using the `config` command:

```
$ leaves config [--global|--local|--project] set KEY VALUE
```

The global configuration is used for global commands, such as `new` or `get`,
and as default if the setting is not found in the project configuration.

The project configuration can be used for example to set the default deployment
method, or to modify the output directories for the project.

The default configuration looks like this:

```json
{
  "i18n": {
    "localesDir": "locales"
  },
  "html": {
    "ext": ".html"
  },
  "css":{
    "outdir": "css"
  },
  "js": {
    "outdir": "js"
  },
  "ports":
    "http": 9000,
    "livereload": 35729
}
```

All build configurations can be prefixed by `dist.` or `dev.` to
be active only in development or distribution environments.

For example, to create a Wordpress theme using Leaves, we used
the following configurations:

```sh
$ leaves config set dist.html.ext .php
$ leaves config set css.outdir .
```

so that the HTML is compiled to `.php` in distribution, and the
CSS is output in the root directory.

Apart from the above configurations, all commands can also be
customized to take defaults arguments, by using

```sh
$ leaves config set commands.COMMAND_NAME.OPTION_NAME VALUE
```

for example:

```sh
$ leaves config set commands.publish.provider ftp
```

<a id="hooks"></a>
### Hooks

When the normal build process and the configuration options
are not enough, hooks can be used to customize the build
process further.

Leaves uses Grunt to build the project, so hooks need
to be written as grunt tasks in a file named
`grunt.hooks.coffee` or `grunt.hooks.js`.

The following tasks are run during the compilation:

* `compile`
  * `clean`
  * `makeCopy`
  * `stylus` (or `less`)
  * `coffee`
  * `views`

All of these can be prefixed by `before` or `after` to
create a hook for the task. For example, a task that runs
after `stylus` would look like this.

```coffee
module.exports = (grunt, config) ->
  grunt.registerTask 'afterStylus', (env) ->
    // do something after CSS has been compiled
```

`config` is the project configuration and `env` is
`tmp` (when watching), `dev` (with `leaves build --development`)
or `dist` (with `leaves build`).

Here is an example of hooks we used when building a JS SDK using Leaves.
We inlined all the CSS in a JS file, and after the build removed everything
except the minified SDK file.

```coffee
path = require 'path'
fs   = require 'fs-extra'
_    = require 'lodash'

SDK_FILE_NAME = "voisee-js-sdk.min.js"

module.exports = (grunt, config) ->
  grunt.registerTask 'afterStylus', 'Inline style', (env) ->
    sdkCssFile = path.join(grunt.config.get('stylus')[env].files[0].dest, 'sdk.css')
    jsOutFile = path.join(grunt.config.get('coffee')[env].files[0].dest, 'sdk', 'style.js')
    sdkCss = fs.readFileSync(sdkCssFile, 'utf8').replace(/\n/g, '')
    jsInline = "VoiseeSDK.css='#{sdkCss}';"
    fs.writeFileSync jsOutFile, jsInline

  grunt.registerTask 'afterCompile', (env) ->
    return unless env == 'dist'
    done = @async()
    sdkFile = path.join(grunt.config.get('coffee').dist.files[0].dest, 'sdk.min.js')
    fs.move sdkFile, "dist/#{SDK_FILE_NAME}", ->
      _.each fs.readdirSync('dist'), (file) ->
        return if file == SDK_FILE_NAME
        fs.removeSync path.join('dist', file)
      done()
```



[generator-static-website]: https://github.com/claudetech/generator-static-website
[github-pages]: https://pages.github.com/
[heroku]: https://www.heroku.com/
[bower]: http://bower.io/
[npm]: https://www.npmjs.org/
[node-lorem-ipsum]: https://github.com/knicklabs/lorem-ipsum.js
[node-cdnify]: https://github.com/claudetech/node-cdnify
[node-glob-html]: https://github.com/claudetech/node-glob-html
[node-static-i18n]: https://github.com/claudetech/node-static-i18n
