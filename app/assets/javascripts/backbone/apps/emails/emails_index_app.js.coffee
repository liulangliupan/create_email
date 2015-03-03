@EmailsApp.module "EmailsApp", (EmailsApp, App, Backbone, Marionette, $, _) ->

  class EmailsApp.Router extends Marionette.AppRouter
    appRoutes:
      "": "emails"
      "emails/create": "create"
      "emails/update/:id": 'update'

  API =
    currentController: null
    emails: ->
      @currentController = new EmailsApp.Show.Controller
#
    create: ->
      @currentController = new EmailsApp.Edit.Controller
#    show: (id)->
#      @currentController.destroy() if @currentController
#      @currentController = new ArticlesApp.Show.Controller
#        id: id
    update: (id)->
      @currentController = new EmailsApp.Edit.Controller id:id
#        id:id
#    destroy: (id) ->
#      App.request "article:destroy", id: id

  App.addInitializer ->
    new EmailsApp.Router
      controller: API
