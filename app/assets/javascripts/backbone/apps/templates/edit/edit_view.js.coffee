@EmailsApp.module "TemplatesApp.Edit", (Edit, App, Backbone, Marionette, $, _) ->

  class Edit.Layout extends App.Views.Layout
    template: "templates/edit/edit_view"

    regions:
      titleRegion: ".t-title-region"
      editRegion: ".t-form-region"

  class Edit.Form extends App.Views.ItemView
    template: "templates/edit/_edit"
    childViewContainer: "form"
    ui:
      name: "#name"
      site: "#site"
      body: "#body"
    events:
      "click input.submit": -> @trigger "templates:edit:submit:click"
      "click input.cancel": ->
        App.navigate("#templates", true)

