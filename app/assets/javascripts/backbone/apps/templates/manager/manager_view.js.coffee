@EmailsApp.module "TemplatesApp.Manager", (Manager, App, Backbone, Marionette, $, _) ->

  class Manager.Layout extends App.Views.Layout
    template: "templates/manager/templates_manager"

    regions:
      listRegion: ".t-list-region"
      editRegion: ".t-edit-region"
      previewRegion: ".t-preview-region"
    events:
      "click .router-create": -> @trigger "create:a:template"

  class Manager.Preview extends App.Views.ItemView
    template: "templates/manager/_preview"
#    childViewContainer: "div"
    tagName: "div"

  class Manager.TemplateView extends App.Views.ItemView
    template: "templates/manager/_template"
    tagName: "tr"
    events:
      "click td.button": ->
        @trigger "templates:manager:template:click"
#      "click .template-edit": ->
#        @trigger "templates:manager:template:ecit:click"

  class Manager.Templates extends App.Views.CompositeView
    template: "templates/manager/_templates"
    childView: Manager.TemplateView
    childViewContainer: "tbody"
