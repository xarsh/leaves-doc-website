# Commands

For every command, you can pass the `--save-options` flag
to remember the options you just passed for future usage.
`--save-options` defaults to `--save-options=project`, which writes
the `.leavesrc` in your project, you can use `--save-options=global`
if you want this to be global to all your project.

The available commands are listed below.

<a id="setup"></a>
## setup

You can run the initial setup to have shell completion by running:

```sh
$ leaves setup
```

Only zsh is supported for now, but PR are welcome.

<a id="new"></a>
## new

To create a new project, just run:

```sh
$ leaves new PROJECT_NAME [--html=ejs] [--css=less]
```

you can then `cd` in `PROJECT_NAME`.

The default engine is [Stylus](http://learnboost.github.io/stylus/).
Add `--css=less` to use [less css](http://lesscss.org/)

The default engine is [Jade](http://jade-lang.com/).
Add `--html=ejs` to use [EJS templates (with layouts)](https://github.com/RandomEtc/ejs-locals)

<a id="build"></a>
## build

Just run

```sh
$ leaves build [--development]
```

in your project directory.
If you want a development build, without
concatenation and minification, pass the `development` flag.

<a id="watch"></a>
## watch

To build and watch your files, run

```sh
$ leaves [watch]
```

(which will run `leaves watch`) in your project directory.

<a id="upgrade"></a>
## upgrade

You can upgrade your leaves installation by running

```sh
$ leaves upgrade
```

This will run `npm update -g leaves` for you and use `sudo` only if needed.

In your working project, you can also run

```sh
$ leaves upgrade -o
```

to get the latest `Gruntfile.coffee` and update your `package.json`
dependencies. Your `Gruntfile.coffee` will be overwritten so be
careful when you use it if you have some changes.
This will also run `npm install` for you to install the latest
dependencies.

<a id="publish"></a>
## publish

You can publish your website to [Heroku][heroku] or to [GitHub Pages][github-pages].

To publish to Heroku, you only need to have a valid account.
To publish to Github, you need to have a remote pointing to github.com in your project.

```sh
$ leaves publish [--skip-build] [--skip-commit] [--skip-install] [--use-dev] [-p PROVIDER]
```

`PROVIDER` parameter can be `github` , `heroku` or `ftp`. The default is `heroku`.
If you want to use the development build to deploy, pass `--use-dev`.

Your website will then be accessible at http://APP_NAME.herokuapp.com when publishing with Heroku and http://USERNAME.github.io/REPO_NAME. with GitHub Pages.
For heroku, `APP_NAME` will default to the appName in `.leavesrc`.

For FTP, you will be asked for your credentials, which will be
stored in `.leavesrc.local`.

<a id="install"></a>
## install

Leaves can be used as a wrapper around [bower][bower] and [npm][npm].

```sh
$ leaves install [PACKAGES [-p PROVIDER] [--no-save]]
```

If no package is given, leaves will run `npm install` and `bower install`.

If packages are given, `PROVIDER` can be either `bower` or `npm`. If provider is not given, it will default to `bower`.

New packages are installed using `--save` by default. You can disable this
behavior by passing `--no-save`.

<a id="get"></a>
## get

Fetch and prepare project for development.

```sh
$ leaves get GIT_REPOSITORY [-p PROTOCOL]
```

`GIT_REPOSITORY` can be anyting that would work with `git clone`,
or for GitHub repositories, the short syntax `user/repo` can be used.
`PROTOCOL` is only relevant when using the short syntax, and can be
`https` (default) or `ssh`.

<a id="config"></a>
## config

Leaves can be configured easily through the command line.

```sh
$ leaves config [TYPE] get key
$ leaves config [TYPE] set key value
$ leaves config [TYPE] unset key
```

where `TYPE` can be `--local` for the local configuration which is gitignored,
`--project` (default) for the project configuration which is not gitignored,
or `--global` for the configuration common to all project.

For example, if you always want to use `ftp` upload for a project, you
could run:

```sh
$ leaves config set commands.publish.provider ftp
```

If you always want to use less css instead of stylus, you could run

```sh
$ leaves config set --global commands.new.css less
```

Local configuration is saved at `PROJECT_ROOT/.leavesrc.local`, project
configuration is saved at `PROJECT_ROOT/.leavesrc` and global configuration
is saved at `$HOME/.leaves/config`. It is a normal JSON file, so
you can of course edit it by hand without any problem.




[generator-static-website]: https://github.com/claudetech/generator-static-website
[github-pages]: https://pages.github.com/
[heroku]: https://www.heroku.com/
[bower]: http://bower.io/
[npm]: https://www.npmjs.org/
[node-lorem-ipsum]: https://github.com/knicklabs/lorem-ipsum.js
[node-cdnify]: https://github.com/claudetech/node-cdnify
[node-glob-html]: https://github.com/claudetech/node-glob-html
[node-static-i18n]: https://github.com/claudetech/node-static-i18n
