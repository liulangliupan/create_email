@EmailsApp.module "TemplatesApp", (TemplatesApp, App, Backbone, Marionette, $, _) ->

  class TemplatesApp.Router extends Marionette.AppRouter
    appRoutes:
      "templates": "managers"
      "templates/create": "create"
      "templates/update/:id": 'update'

  API =
    currentController: null
    managers: ->
      @currentController = new TemplatesApp.Manager.Controller
#
    create: ->
      @currentController = new TemplatesApp.Edit.Controller
#    show: (id)->
#      @currentController.destroy() if @currentController
#      @currentController = new ArticlesApp.Show.Controller
#        id: id
    update: (id)->
      @currentController = new TemplatesApp.Edit.Controller
        id:id
#    destroy: (id) ->
#      App.request "article:destroy", id: id

  App.addInitializer ->
    new TemplatesApp.Router
      controller: API
