# Getting started
## Quick start

To install leaves, run

```sh
$ npm install -g leaves
```

If `npm install` fails, try to use `sudo`.

Then, to install some extra dependencies automatically
and setup the shell completion, run

```sh
$ leaves setup
```

to start a new project

```sh
$ leaves new project_name
$ cd project_name
$ leaves
```

and start coding!

### Get a project from Git

```sh
$ leaves get https://github.com/me/my_leaves_project.git
$ cd my_leaves_project
$ leaves
```

and start coding!


<a id="mainfunctionalities"></a>
## Main functionalities

* HTML templating via [Jade](http://jade-lang.com/) or [EJS](https://github.com/RandomEtc/ejs-locals)
* CSS templating via [Stylus](http://learnboost.github.io/stylus/) or [less](http://lesscss.org/)
* [CoffeeScript](http://coffeescript.org/) compilation
* Project watch and livereload
* Scripts and stylesheets globbing with `**/*.js` like syntax
* Compile error displayed in browser
* Single command deploy to Heroku and GitHub pages, and FTP servers
* Simple internationalization support
* Misc: lorem-ipsum generator, easy CDN usage, shell completion, single command upgrade, dev mode



<a id="structure"></a>
## Structure

The app has the following structure:

```
.
├── assets
│   ├── css
│   │   ├── .keep
│   │   └── main.styl
│   ├── favicon.ico
│   ├── img
│   │   └── .keep
│   └── js
│       ├── app.coffee
│       └── .keep
├── bower.json
├── .bowerrc
├── .gitignore
├── .gruntfile.coffee
├── .leavesrc
├── .leavesrc.local
├── package.json
└── views
    ├── index.jade
    └── layout.jade
```

when running leaves, `views` and `assets` are watched,
compiled or copied on change and your browser is reloaded.




[generator-static-website]: https://github.com/claudetech/generator-static-website
[github-pages]: https://pages.github.com/
[heroku]: https://www.heroku.com/
[bower]: http://bower.io/
[npm]: https://www.npmjs.org/
[node-lorem-ipsum]: https://github.com/knicklabs/lorem-ipsum.js
[node-cdnify]: https://github.com/claudetech/node-cdnify
[node-glob-html]: https://github.com/claudetech/node-glob-html
[node-static-i18n]: https://github.com/claudetech/node-static-i18n
