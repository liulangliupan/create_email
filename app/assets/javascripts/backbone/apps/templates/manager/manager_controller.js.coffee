@EmailsApp.module "TemplatesApp.Manager", (Manager, App, Backbone, Marionette, $, _) ->

  class Manager.Controller extends App.Controllers.Base
    initialize: () ->
      @layoutView = @getLayoutView()
      @show @layoutView
      @templatesView()

    templatesView: ->
      templates = App.request "templates:templates:getEmails"
      view = @getTemplatesView(templates)
      @show view, region: @layoutView.listRegion

      view.childEvents =
        "templates:manager:template:click": (templateView)=>
          @previewView(templateView.model)
        "templates:manager:template:ecit:click": (templatesView)=>



    previewView: (templateModel) ->
      @preview = @getPreviewView(templateModel.clone())
      opts =
        region: @layoutView.previewRegion
        loading: true
#      @show @preview, opts
      App.dialogRegion.show @preview

    getLayoutView: ->
      new Manager.Layout

    getTemplatesView: (templates)->
      new Manager.Templates
        collection: templates

    getPreviewView: (templateModel)->
      new Manager.Preview model:templateModel