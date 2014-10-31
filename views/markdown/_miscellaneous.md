# Miscellaneous
## Easy lorem ipsum generation

The function `lorem` is available in all templates.
Just call

```jade
= lorem(10)
```

and you will get 10 words of lorem ipsum.
For other options, see the actual [package documentation][node-lorem-ipsum]

<a id="dummyimage"></a>
## Dummy images generation

You can use Leaves to easily generate dummy images of any size
when during development.

The function `dumimg` is available as a helper in all your templates,
and you can use it the following way:

```
= img(src=dumimg(128, 128, 'random', 'http://my/real/image.jpg'))
```

This will generate a random image of size 128x128 pixels.
The image source will be replaced by the 4th parameter during
production builds. All the parameters are optional. If you omit
the last parameter, the dummy image will be used even for
production build.

The available image types are for now

* `user`
* `food`
* `mountain`
* `sea`

You can also pass an object to `dumimg`:

```
= img(src=dumimg({width: 48, height: 48, type: 'random', replace: 'http://my/real/image.jpg'}))
```

if you want to only pass some of the options.

<a id="fileglobbing"></a>
## `script` and `link` globbing

To avoid having to insert all scripts in your layout,
you can use glob syntax.

```jade
html
  head
    script(src="js/**/*.js" glob)
    link(rel="stylesheet" href="css/**/*.css" glob)
```

will become

```html
<html>
<head>
  <script src="js/app.js">
  <script src="js/other.js">
  <script src="css/main.css">
  <script src="css/other.css">
</head>
<body>
</body>
</html>
```

for development build and

```html
<html>
<head>
  <script src="js/application.min.js">
  <script src="css/application.min.css">
</head>
<body>
</body>
</html>
```

for production build, where `js/application.min.js` and
`css/application.min.css` will be concatenated and
minified versions of the globbed files.

### Files order

If alphabetical order does not fit your need, you can
use glob on single files, it will be inserted only once in the output.

```jade
html
  head
    script(src="js/this-one-is-first.js" glob)
    script(src="js/**/*.js" glob)
    link(rel="stylesheet" href="css/**/*.css" glob)
```

The files will always be concatenated in order of appearance.

Check out [the documentation][node-glob-html] for more details.

<a id="cdnusage"></a>
## CDN for production

For library such as jQuery, it is common to use a CDN
in production, but it can be better for development to
used a local and non minified version of the library.
You can achieve this easily with the following syntax.

```jade
html
  head
    script(src="compnents/jquery/dist/jquery.js" cdn="//code.jquery.com/jquery-2.1.1.min.js")
    link(rel="stylesheet" href="components/bootstrap/dist/css/bootstrap.css" cdn="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css")
```

Note that `cdn` attribute is not compatible with `glob` and will
result in a compile error.

Check out [the documentation][node-cdnify] for more details.

<a id="devmode"></a>
## Dev mode

Leaves has a very simple development mode to
change your templates dynamically in development and production.
In your Jade templates, use the following:

```jade
if dev
  p This is dev
else
  p This is prod
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
