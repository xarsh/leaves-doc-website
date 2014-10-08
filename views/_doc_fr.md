## Fonctionnalités principales

* Template HTML avec [Jade](http://jade-lang.com/) ou [EJS](https://github.com/RandomEtc/ejs-locals)
* Préprocesseur CSS avec [Stylus](http://learnboost.github.io/stylus/) ou [less](http://lesscss.org/)
* Compilation de [CoffeeScript](http://coffeescript.org/)
* Détection des changements et actualisation automatique du navigateur
* Inclusion automatique des scripts et feuilles de styles avec une syntaxe shell-like: `**/*.js`
* Erreurs de compilation affichées dans le navigateur
* Déploiement vers Heroku, Github pages ou serveurs FTP en une seule commande
* Support de l'internationalisation facile à utiliser
* Plus: générateur lorem-ipsum, CDN pour la production, auto-complétion,
  mise à jour en une seule commande

## Installation
<a id="installation"></a>

Pour installer Leaves, utiliser la commande ci-dessous.

```sh
$ npm install -g leaves
```

Si `npm install` échoue, essayer avec `sudo`.

Pour installer quelques dépendances, et activer l'auto-complétion,
utiliser la commande suivante.

```sh
$ leaves setup
```

## Pour commencer
<a id="gettingstarted"></a>

### Créer un nouveau projet

```sh
$ leaves new nom_du_projet
$ cd nom_du_projet
$ leaves
```

et codez!

### Récupérer un projet de Git

```sh
$ leaves get https://github.com/moi/mon_projet_leaves.git
$ cd mon_projet_leaves
$ leaves
```

et codez!

## Structure du project

Un projet a la structure suivante:

```
.
├── assets
│   ├── css
│   │   └── main.styl
│   ├── favicon.ico
│   ├── img
│   └── js
│       └── app.coffee
├── bower.json
├── package.json
└── views
    ├── index.jade
    └── layout.jade
```

en lançant leaves, les dossiers `views` et `assets` sont
surveillés, et les fichiers sont compilés ou copiés
lorsque un changement est détecté.

## Commandes
<a id="usage"></a>

Pour toutes les commands,  `--save-options` peut être passé
en options, pour enregistrer les arguments pour le prochain usage.
`--save-options` utilise par défault `.leavesrc` pour enregistrer
les arguments. Pour enregistrer les changements pour tous les projets,
utiliser `--save-options=global`.

Les différentes commandes sont décrites ci-dessous.

<a id="setup"></a>
### Préparer

Initialise Leaves, notamment pour l'auto-complétion, pour le premier usage.

```sh
$ leaves setup
```

L'auto-complétion n'est pour le moment disponible qu'avec zsh.

<a id="new"></a>
### Créer

Crée un nouveau projet.

```sh
$ leaves new NOM_DU_PROJET [--html=ejs] [--css=less]
```

Le projet est créé dans un dossier appelé `NOM_DU_PROJET`.

#### Préprocesseur CSS

Le préprocesseur par défaut est [Stylus](http://learnboost.github.io/stylus/).
Pour utiliser [less css](http://lesscss.org/), passer `--css=less`
lors de la création du projet.

#### Moteur de template HTML

Le moteur de template par défaut est [Jade](http://jade-lang.com/).
Pour utilser [EJS](https://github.com/RandomEtc/ejs-locals), passer
 `--html=ejs` lors de la création du projet.

<a id="build"></a>
### Compiler

Compile le projet.

```sh
$ leaves build [--development]
```

Pour une compilation en mode dévelopement, sans concaténation
ou minimification, passer `--development`.

<a id="watch"></a>
### Surveiller

Surveille le projet pour détecter les changements.

```sh
$ leaves [watch]
```

`watch` est l'action par défaut, et donc optionnelle.

<a id="upgrade"></a>
### Mettre à jour

Pour mettre à jour l'installation de Leaves.

```sh
$ leaves upgrade
```

Cette command exécute `npm update -g leaves`, avec `sudo` si nécessaire.

Pour mettre à jour le projet actuel, ajouter `-o`

```sh
$ leaves upgrade -o
```

Cette commande met à jour `.gruntfile.coffee` et `package.json`
automatiquement. Tout changement à `.gruntfile.coffee` sera perdu.
`npm install` sera aussi exécuté pour installer les dernières
mises à jour des bibliothèques utilisées.

<a id="publish"></a>
### Publier

Pour publier le projet sur [Heroku][heroku], [GitHub Pages][github-pages],
ou un serveur FTP.

Pour publier sur Heroku, un compte valide est nécessaire.
Pour publier sur GitHub, un dépôt distant doit pointer github.com.

```sh
$ leaves publish [--skip-build] [--skip-commit] [--skip-install] [--use-dev] [-p PROVIDER]
```

`PROVIDER` peut être  `github` , `heroku` ou `ftp`, le défault étant `heroku`.
Pour publier une version de dévelopement, passer l'option `--use-dev`.

Le projet sera alors accessible à http://APP_NAME.herokuapp.com pour Heroku,
et http://USERNAME.github.io/REPO_NAME pour GitHub.

Lors de l'utilisation du FTP, les information du serveur seront demandées et
stockées dans `.leavesrc.local`, qui est ignoré par git.

<a id="install"></a>
### Installer

Leaves peut être utiliser pour installer des bibliothèques avec
[bower][bower] ou [npm][npm].

```sh
$ leaves install [BIBLIOTEQUES [-p PROVIDER] [--no-save]]
```

Si la commande n'a pas d'arguments, Leaves lancera les commandes
`npm install` et `bower install`.

Si la commande a des arguments, les BIBLIOTEQUES seront installées
en utilisant le `PROVIDER`, qui peut être `bower` ou `npm`, le défaut
étant `bower`.

Les nouvelles bibliothèques sont installées avec `--save` par défaut.
Pour désactiver cet fonction, passer `--no-save`.

<a id="get"></a>
### Récupérer

Télécharge et prépare un projet pour le dévelopement.

```sh
$ leaves get GIT_REPOSITORY [-p PROTOCOL]
```

`GIT_REPOSITORY` peut être n'importe quoi utilisable par `git clone`.
Pour les dépôts Github, la syntaxe `utilisateur/depot` peut être utilisée.
`PROTOCOL` n'est utile que dans ce cas, où il peut être `https` (défaut) ou `ssh`.

<a id="config"></a>
### Configurer

Configure Leaves.

```sh
$ leaves config [TYPE] get key
$ leaves config [TYPE] set key value
$ leaves config [TYPE] unset key
```


`TYPE` peut être `--local` pour une configuration locale, ignorée par git,
`--project` (défaut) pour une configuration du projet, incluse par git,
ou `--global` pour une configuration commune à tous les projets.

Par example, pour toujours publier un projet par ftp, la commande suivante
peut être utilisée.

```sh
$ leaves config set commands.publish.provider ftp
```

Pour utiliser less au lieu de stylus dans tous les nouveux projets,
la commande suivante peut être utilisée.

```sh
$ leaves config set --global commands.new.css less
```

Les réglages locaux sont sauvegardés dans `PROJECT_ROOT/.leavesrc.local`,
les réglages du projet dans `PROJECT_ROOT/.leavesrc`, et les réglages
globaux dans `$HOME/.leaves/config`.
Les fichiers de configuration sont des fichiers JSON normaux et peuvent
donc être édités à la main sans inconvénient.

<a id="functionalities"></a>
## Fonctionnalités

<a id="lorem-ipsum"></a>
### Générateur de lorem ipsum

La fonction `lorem` est accessible dans tous les templates.

```jade
= lorem(10)
```

La commande ci-dessus génère 10 mots aléatoires de lorem ipsum.
Pour plus d'options, voir [la documentation][node-lorem-ipsum].

<a id="globbing"></a>
### Inclusion de `script` et `link`

Pour éviter d'avoir à inclure tous les scripts et feuilles de style
dans le layout, une syntax shell-like peut être utilisée.

```jade
html
  head
    script(src="js/**/*.js" glob)
    link(rel="stylesheet" href="css/**/*.css" glob)
```

sera transformé en:

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

lors du dévelopement, et en

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

pour la production. `js/application.min.js` et `css/application.min.css`
sont une version concaténée et minimifiée des fichiers inclus.

#### Ordre des fichiers

Dans certains cas, l'ordre alphabétique n'est pas acceptable.
En utilisant glob sur le fichier, il sera inclu une seule fois,
et ignoré par la suite lors de l'utilisation de wildcard.

```jade
html
  head
    script(src="js/this-one-is-first.js" glob)
    script(src="js/**/*.js" glob)
    link(rel="stylesheet" href="css/**/*.css" glob)
```

Les fichiers sont toujours concaténés par ordre d'apparition.

Voir [la documentation][node-glob-html] pour plus d'information.

<a id="cdn"></a>
### Utilisation de CDN

Pour des bibliothèques telles que jQuery, il est fréquent
d'utiliser un CDN en production. Il est cependant parfois
préférable d'utiliser une version locale, possiblement non
compréssée pour le dévelopement.
Ceci peut éffectué facilement avec la syntaxe ci-dessous.

```jade
html
  head
    script(src="compnents/jquery/dist/jquery.js" cdn="//code.jquery.com/jquery-2.1.1.min.js")
    link(rel="stylesheet" href="components/bootstrap/dist/css/bootstrap.css" cdn="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css")
```

L'attribut `cdn` n'est pas compatible avec `glob`, et l'usage
des deux provoquera une erreur de compilation.

Voir [la documentation][node-cdnify] pour plus d'information.

<a id="dev-mode"></a>
### Mode dév

Leaves a un mode dévelopement très simple. Pour séparer
le HTML généré lors du développement, et de la production,
il suffit d'utiliser la syntaxe suivante.

```jade
if dev
  p C'est le mode développement
else
  p C'est le mode production
```

<a id="i18n"></a>
### Internationalisation

Leaves a des fonctionnalités d'internationalisation intégrées.

La langue par défaut est compilée à `/` et les autres langues
sont compilées à `/LANG/`.

Les différentes langues sont générées automatiquement à partir
des fichiers qui ont la forme `locales/LANG.yml`.

Voici un example.

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

Cette example va générer la version anglaise à `/` et la version
française à `/fr`.

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

Pour régler le français comme langue par défaut,
utiliser la commande suivante.

```sh
$ leaves config set i18n.locale fr
```

Voir [la documentation][node-static-i18n] pour plus d'information.
Toutes les options de static-i18n peuvent être changées
dans `.leavesrc` avec la clé `i18n`.


[generator-static-website]: https://github.com/claudetech/generator-static-website
[github-pages]: https://pages.github.com/
[heroku]: https://www.heroku.com/
[bower]: http://bower.io/
[npm]: https://www.npmjs.org/
[node-lorem-ipsum]: https://github.com/knicklabs/lorem-ipsum.js
[node-cdnify]: https://github.com/claudetech/node-cdnify
[node-glob-html]: https://github.com/claudetech/node-glob-html
[node-static-i18n]: https://github.com/claudetech/node-static-i18n
