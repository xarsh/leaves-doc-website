## 機能一覧

* [Jade](http://jade-lang.com/)や[EJS](https://github.com/RandomEtc/ejs-locals)を用いたHTMLテンプレート
* [Stylus](http://learnboost.github.io/stylus/)や[less](http://lesscss.org/)を用いたCSSテンプレート
* [CoffeeScript](http://coffeescript.org/)のコンパイル
* プロジェクトの変更監視とブラウザの自動更新
* スクリプトとスタイルシートの自動インクルード
* ブラウザ画面上でのコンパイルエラー表示
* 1つのコマンドでHeroku、GitHubページ、FTPにデプロイ
* 多言語化対応
* その他: lorem-ipsumジェネレーター, CDNの自動使用, シェル補完, 簡単アップグレード, 開発者モード

<a id="installation"></a>
## インストール

Leavesのインストールは、以下のコマンドで行えます。

```sh
$ npm install -g leaves
```

パーミッション関連のエラーが発生した場合は、`sudo`をコマンドの先頭に付加した上で実行して下さい。

<a id="gettingstarted"></a>
## はじめに

### 開発をはじめる

```sh
$ leaves new project_name
$ cd project_name
$ leaves
```

### Gitからプロジェクトを取得する

```sh
$ leaves get https://github.com/me/my_leaves_project.git
$ cd my_leaves_project
$ leaves
```


## プロジェクトの構造

Leavesで制作したプロジェクトは、以下の構造をもちます。

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

leavesが起動しているときは、`views`, `assets`ディレクトリが監視されます。
それらのディレクトリ内部に変更が与えられた場合は、自動でファイルがコンパイルされ、同時にブラウザが更新されます。

<a id="usage"></a>
## 使いかた

各コマンドには、オプションの保存のため`--save-options`というフラグを与えることができます。
保存されたオプションは次回のコマンド時に自動で付加されます。
`--save-options`は`--save-options=project`として解釈されます。
これは入力したオプションの保存先を指定するもので、通常は`.leavesrc`というファイルになります。
また、`--save-options=global`とした場合は、保存したオプションがすべてのプロジェクトに共通で使われます。

各コマンドの詳細は次のセクションを御覧ください。

## コマンド

<a id="setup"></a>
### セットアップ

シェルの補完を有効にしたい場合は次のコマンドを実行してください。

```sh
$ leaves setup
```

現在はzshにのみ対応しておりますが、PRは大歓迎です。

<a id="new"></a>
### 新規作成

新規プロジェクトを作成する場合は次のコマンドを実行してください。

```sh
$ leaves new PROJECT_NAME [--html=ejs] [--css=less]
```

その後`PROJECT_NAME`に`cd`し、開発を始めましょう。

#### CSSエンジン

デフォルトのエンジンは[Stylus](http://learnboost.github.io/stylus/)です。
[less css](http://lesscss.org/)を使う場合は`leaves new`に`--css=less`を追加してください。

#### HTMLテンプレートエンジン

デフォルトのエンジンは[Jade](http://jade-lang.com/)です。
[EJS templates (with layouts)](https://github.com/RandomEtc/ejs-locals)を使う場合は`leaves new`コマンドを実行する際に、`--html=ejs`を追加してください。

<a id="build"></a>
### ビルド

各ファイルを一括でコンパイルする場合は、プロジェクトのディレクトリから次のコマンドを実行してください。

```sh
$ leaves build [--development]
```

コマンドの末尾に`--development`を追加すると開発モードになります。
この場合は、通常ビルド時に行われるファイルの軽量化と結合を行いません。

<a id="watch"></a>
### 監視

プロジェクトを監視し、各ファイルの変更をブラウザ画面に自動で反映させたい場合はプロジェクトのディレクトリから次のコマンドを実行してください。

```sh
$ leaves [watch]
```

<a id="upgrade"></a>
### アップグレード

Leavesをアップグレードする場合は次のコマンドを実行してください。

```sh
$ leaves upgrade
```

プロジェクトのディレクトリから、

```sh
$ leaves upgrade -o
```

を実行すると、`package.json`も一緒に更新されます。

<a id="publish"></a>
### 公開

作ったサイトを[Heroku][heroku]か[GitHub Pages][github-pages]、またはFTPサーバーにアップロードすることができます。

Herokuに公開する場合はHerokuのアカウントが必要です。
また、Githubで公開する場合は、Github上にリモートリポジトリを作成する必要があります。

```sh
$ leaves publish [--skip-build] [--skip-commit] [--skip-install] [--use-dev] [-p PROVIDER]
```

`PROVIDER`として`github`か`heroku`、または`ftp`を指定することができます。デフォルトは`heroku`です。
ビルド時のファイル軽量化と結合を行わずに公開する場合は、`--use-dev`をつけてください。

Herokuの場合、http://APP_NAME.herokuapp.com というURLで公開されます。
Github Pagesの場合、http://USERNAME.github.io/REPO_NAME というURLで公開されます。

また、FTPを使用してアップロードする場合、認証用のユーザー情報を尋ねられます。
その際に入力した内容は`.leaves.local`に保存されます。

<a id="install"></a>
### インストール

Leavesを使用して[bower][bower]や[npm][npm]を使用したライブラリのインストールが行えます。

```sh
$ leaves install [PACKAGES [-p PROVIDER] [--no-save]]
```

パッケージが指定されていない時は`npm install`と`bower install`が実行されます。

パッケージが指定されている場合は、`PROVIDER`を`bower`か`npm`にできます。デフォルトは`bower`です。

新しいパッケージはbowerとnpmの`--save`オプションを使って入れることができます。
`bower.json`に依存関係を書き込まないようにしたい場合は、`--no-save`をコマンドに付けてください。

<a id="get"></a>
### 取得

プロジェクトのダウンロードと準備が行えます。

```sh
$ leaves get GIT_REPOSITORY [-p PROTOCOL]
```

`GIT_REPOSITORY`は`git clone`で使えるものは何でも指定できます。
また、Githubレポジトリの場合、`ユーザ名/レポジトリ名`のような文法も使えます。
その際は`PROTOCOL`として、`https`(デフォルト)か`ssh`を指定できます。


<a id="config"></a>
### 設定

Leavesの設定はコマンドラインから簡単に行えます。

```sh
$ leaves config [TYPE] get key
$ leaves config [TYPE] set key value
$ leaves config [TYPE] unset key
```

`TYPE`に指定できるオプションは3つあります。標準では`--project`が使われ、この時設定された値はGitで管理されます。
また`--local`であればGitで管理されなくなり、さらに`--global`を指定した場合は、設定した内容がすべてのプロジェクトに適用されます。

例えば、もし今のLeavesプロジェクトでFTPアップロード機能を常に使いたい場合は、以下のコマンドを入力してください。

```sh
$ leaves config set commands.publish.provider ftp
```

もしCSSのテンプレートエンジンとしてStylusではなくlessを使用したい場合は、以下のようになります。

```sh
$ leaves config set --global commands.new.css less
```

他者と共有しない自分だけの設定は`PROJECT_ROOT/.leavesrc.local`に、プロジェクト全体での設定は
`PROJECT_ROOT/.leavesrc`に、またすべてのプロジェクトに適用されるグローバル設定は
`$HOME/.leaves/config`に保存されます。
設定ファイルの形式は普通のJSONなので、テキストエディタなどで直接編集することも可能です。


<a id="functionalities"></a>
## その他の機能

<a id="lorem-ipsum"></a>
### lorem ipsumジェネレーター

すべてのテンプレートで`lorem`関数が使えます。

```jade
= lorem(10)
```

でlorem ipsumのランダムな10単語が生成されます。
オプションについては[パッケージのドキュメンテーション][node-lorem-ipsum]をご覧ください。

<a id="globbing"></a>
### スクリプトとスタイルシートの自動インクルード

レイアウトで大量のスクリプトを読み込ませる手間を省くため、次のように書くことができます。

```jade
html
  head
    script(src="js/**/*.js" glob)
    link(rel="stylesheet" src="css/**/*.css" glob)
```

開発ビルドの場合は、上記のコードで次のようなHTMLが生成されます。

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

プロダクションビルドで次のように生成されます。

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

`application.min.js`と`application.min.css`は結合と圧縮がなされたファイルです。

ファイルは辞書順で結合されますが、別の順番で機能を使いたい場合は
以下の例を参考に、タグに`glob`をつけてHTML上で指定してください。


```jade
html
  head
    script(src="js/this-one-is-first.js" glob)
    script(src="js/**/*.js" glob)
    link(rel="stylesheet" href="css/**/*.css" glob)
```

この場合ではHTML上での順番が優先されます。
また、同じファイルは一度しかインクルードされません。
より詳しい使い方については、[ドキュメンテーション][node-glob-html]をご覧ください。


<a id="cdn"></a>
### ビルド時のCDN使用

jQueryのようなライブラリーをデプロイ後にロードするときは、速度的、負荷的な理由により通常CDNが使われます。
しかし、サイトの開発を進める際にはローカルから軽量化を施す前のライブラリを読みだせるほうがよいでしょう。
そのため、Leavesにはビルド時に自動的にCDNを使ったURLにタグの属性を書き換える機能が搭載されています。

```jade
html
  head
    script(src="compnents/jquery/dist/jquery.js" cdn="//code.jquery.com/jquery-2.1.1.min.js")
    link(rel="stylesheet" href="components/bootstrap/dist/css/bootstrap.css" cdn="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css")
```

このとき、`cdn`属性は`glob`属性と同時に使用することができないという点に留意してください。
ビルド時にエラーとなります。

詳細は [the documentation][node-cdnify] を参照ください。


<a id="dev-mode"></a>
### 開発者モード

Leavesでページを開発している段階と、実際にサイトを公開する段階では表示したい内容が異なることがあります。
そのような場合はテンプレートの内容を開発時とビルド時で動的に切り替えましょう。
Jadeのテンプレートでは、以下のように`dev`変数を使えます。

```jade
if dev
 p This is dev
else
 p This is prod
```



<a id="i18n"></a>
### 多言語化

Leavesには基本的なページ多言語化のための機能が備わっています。

`/`をデフォルトのロケールとし、その他の言語のページは`/LANG/`に生成されます。

`locales/LANG.yml`に存在する辞書ファイルを元に、ビルド時にすべての言語を翻訳します。

以下に簡単な例を挙げます。

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

以上のコマンドにより、英語版のページが`/`に、フランス語版のページが`/fr`に生成されます。

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

デフォルトの言語をフランス語にする場合は、以下のコマンドを実行してください。

```sh
$ leaves config set i18n.locale fr
```

詳細は[ドキュメント][node-static-i18n]を御覧ください。
すべてのstatic-i18nに関する設定は`.leavesrc`の中で`i18n`というキーの元で行われます。


[generator-static-website]: https://github.com/claudetech/generator-static-website
[github-pages]: https://pages.github.com/
[heroku]: https://www.heroku.com/
[bower]: http://bower.io/
[npm]: https://www.npmjs.org/
[node-lorem-ipsum]: https://github.com/knicklabs/lorem-ipsum.js
[node-glob-html]: https://github.com/claudetech/node-glob-html
[node-cdnify]: https://github.com/claudetech/node-cdnify
[node-static-i18n]: https://github.com/claudetech/node-static-i18n
