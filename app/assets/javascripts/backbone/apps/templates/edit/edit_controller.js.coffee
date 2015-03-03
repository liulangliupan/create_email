@EmailsApp.module "TemplatesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base
    initialize: (params={}) ->
      console.log 'edit view', params
      @layoutView = @getLayoutView()
      @show @layoutView
      if params.id then @updateView(params.id) else @createView()

    createView: ->
      view = @getEditView()
      @show view, region: @layoutView.editRegion
      view.on "templates:edit:submit:click", ->
        console.log 'templates:edit:submit:click'
        data =
          name: view.ui.name.val()
          site: view.ui.site.val()
          body: view.ui.body.val()
        App.request "templates:edit:create", data,
          wait: true
          success: (model, resp, options)->
#            window.document.location.href = "#templates"
            App.navigate "#templates", true

    updateView: (params) ->
      return console.error 'the templates model should be a valid.', params if !params
      model = App.request "templates:getEmails:model:by:id", params
      view = @getEditView(model)
      @show view, region: @layoutView.editRegion
      view.on "templates:edit:submit:click", ->
        model.set
          name: view.ui.name.val()
          site: view.ui.site.val()
          body: view.ui.body.val()
        App.request "templates:edit:update", model,
          success: (model, resp, options) ->
            App.navigate "#templates", true



    getLayoutView: ->
      new Edit.Layout

    getEditView: (params)->
      if params then new Edit.Form(model: params) else new Edit.Form