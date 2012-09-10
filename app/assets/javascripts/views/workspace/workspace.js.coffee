class App.Views.Workspace extends Backbone.View

  el: 'body'

  events:
    'click .add' :      'add'
    'click .settings' : 'settings'

  add: (e) ->
    e.preventDefault()
    $(@el).append new App.Views.Toolbar

  settings: (e) ->
    e.preventDefault()
    $(@el).append new App.Views.Settings