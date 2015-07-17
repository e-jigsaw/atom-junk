module.exports =
  activate: ->
    require 'atom-livescript'
    require('./src/index.ls').activate()
