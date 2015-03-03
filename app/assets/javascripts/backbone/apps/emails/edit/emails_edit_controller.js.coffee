@EmailsApp.module "EmailsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Controller extends App.Controllers.Base

    initialize: (param)->
      @layout = new Edit.Layout
      @show @layout
      if param.id then @editView(param.id) else @createView()

    createView: ->
      view = @getEditView()
      @show view, region: @layout.editRegion
      view.on "emails:edit:submit:click", ->
        data =
          name: view.ui.name.val()
          cline: view.ui.cline.val()
          story_id: view.ui.storyID.val()
          story_url: view.ui.storyUrl.val()
          launch_date: view.ui.launchDate.val()
          template_body: view.ui.template.val()
          body: view.ui.body.val()
        App.request "emails:edit:create", data,
          success: (model, resp, options)->
            App.navigate("#", true)
      view.on "emails:edit:preview:click", ->
        console.log 'preview'

    editView: (params) ->
      @previewView()
      return console.error 'the email model should be a valid.', params if !params
      email = App.request "entities:emails:getEmailModelById", params
      email.set({launch_date:'12121987'})
      view = @getEditView(email)
      @show view, region: @layout.editRegion

      view.on "emails:edit:submit:click", ->
        data =
          name: view.ui.name.val()
          cline: view.ui.cline.val()
          story_id: view.ui.storyID.val()
          story_url: view.ui.storyUrl.val()
          launch_date: view.ui.launchDate.val()
          template_body: view.ui.template.val()
          body: @editor.getValue()
        email.set data
        App.request "emails.edit:update", email,
          success: (model, resp, options) ->
            App.navigate "#", true

    previewView: ->
      view = @getPreviewView()
      @show view, region: @layout.previewRegion

    getEditView: (email)->
      return new Edit.EditView model: email if email
      new Edit.EditView

    getPreviewView: ->
      return new Edit.PreviewView