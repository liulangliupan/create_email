@EmailsApp.module "EmailsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Layout extends App.Views.Layout
    template: "emails/show/emails_view"
    regions:
      emailsRegion: ".emails-region"
      panelRegion: ".panel-region"

  class Show.EmailItemView extends App.Views.ItemView
    template: "emails/show/_email"
    tagName: "tr"


  class Show.EmailsView extends App.Views.CompositeView
    template: "emails/show/_emails"
    childView: Show.EmailItemView
    childViewContainer: "tbody"
    tagName: 'table'
    className:"table table-bordered table-striped"

