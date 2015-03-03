@EmailsApp.module "EmailsApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: "emails/edit/new_email_view"
    regions:
      editRegion: ".edit-region"
      previewRegion: ".preview-region"


  class Edit.PreviewView extends App.Views.ItemView
    template: "emails/edit/_preview_view"
    initialize: ()->
      App.vent.on 'edit:previewView:onPreviewChanger', @onPreviewChanger, @
    ui:
      previewContainer: ".preview-container"
    setView: (dome)->
      @ui.previewContainer.html(dome)
    onPreviewChanger: (value)->
      @setView(value)

  class Edit.EditView extends App.Views.ItemView
    template: "emails/edit/_edit_view"
#    childViewContainer: "form"
    ui:
      name: "#name"
      cline: "#cline"
      storyID: "#story_id"
      storyUrl: "#story_url"
      launchDate: "#launch_date"
      template: "#template"
    events:
      "click .submit": -> @trigger "emails:edit:submit:click"
      "click .preview": -> @trigger "emails:edit:preview:click"
      "click .cancel": -> App.navigate("#", true)
    modelEvents: ->
      "change:name": -> console.log "change anme on model events"
    onShow: ->
      console.log 'editView initialize', this.model
      @editor = ace.edit("editor")
      @editor.setTheme "ace/theme/chrome"
      @editor.getSession().setMode "ace/mode/html"
      if @model
        @editor.setValue @model.get('body')
        App.vent.trigger "edit:previewView:onPreviewChanger", @model.get('body')
      @editor.on "change", @onEditorChange

    onEditorChange:(e)=>
      App.vent.trigger "edit:previewView:onPreviewChanger", @editor.getValue()
