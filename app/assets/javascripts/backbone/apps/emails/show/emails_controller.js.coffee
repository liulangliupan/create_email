@EmailsApp.module "EmailsApp.Show", (Show, App, Backbone, Marionette, $, _) ->

  class Show.Controller extends App.Controllers.Base
    initialize: ()->
      @layout = @getEmailsLayout()
      @show @layout
      @emailsView()

    emailsView: ->
      emails = App.request 'emails:show:getEmails'
      view = @getEmailsView(emails)

      @show view, region:@layout.emailsRegion

#      view.on

    getEmailsLayout: ->
      new Show.Layout

    getEmailsView: (emails)->
      new Show.EmailsView
        collection: emails

