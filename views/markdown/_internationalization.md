# Internationalization

Leaves has a basic internationalization functionality integrated.

It translates the default locale at `/`, and the other locales
at `/LANG/`.

Translated files are generated automatically, from all the files matching `locales/LANG.yml`.

Here is a short example

`index.jade`

```jade
block content
  h1(data-t="greetings.hi")
  h4(data-t) greetings.bye
```

`locales/en.yml`

```yml
greetings:
  hi: Hello!
  bye: Goodbye!
```

`locales/fr.yml`

```yml
greetings:
  hi: Bonjour!
  bye: Au revoir!
```

will generate the English version at `/` and the French version
at `/fr`.

`dist/index.html`:

```html
<h1>Hello!</h1>
<h4>Goodbye!</h4>
```

`dist/fr/index.html`:

```html
<h1>Bonjour!</h1>
<h4>Au revoir!</h4>
```

To set the default language to French, you can run

```sh
$ leaves config set i18n.locale fr
```

For more information, [check out the documentation][node-static-i18n].
All the options of static-i18n can be customized
in `.leavesrc`, under the `i18n` key.


[generator-static-website]: https://github.com/claudetech/generator-static-website
[github-pages]: https://pages.github.com/
[heroku]: https://www.heroku.com/
[bower]: http://bower.io/
[npm]: https://www.npmjs.org/
[node-lorem-ipsum]: https://github.com/knicklabs/lorem-ipsum.js
[node-cdnify]: https://github.com/claudetech/node-cdnify
[node-glob-html]: https://github.com/claudetech/node-glob-html
[node-static-i18n]: https://github.com/claudetech/node-static-i18n
