_    = require 'lodash'
fs   = require 'fs'
i18n = require 'i18n'

config = JSON.parse(fs.readFileSync('./.leavesrc'))

i18n.configure
  locales: ['en', 'ja']
  objectNotation: true
  directory: __dirname + '/locales'
  defaultLocale: config?.i18n?.locale || 'en'

module.exports = (grunt) ->
  _.each ['', 'dev.', 'dist.'], (env) ->
    data = grunt.config.get("jade.#{env}options.data")
    data.t = i18n.__
    grunt.config.set("jade.#{env}options.data", data)
