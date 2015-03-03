@EmailsApp.module "Entities", (Entities, App, Backbone, Merionette, $, _) ->

  class Entities.EmailsModel extends Entities.Model

  class Entities.EmailsCollection extends Entities.Collection
    model: Entities.EmailsModel
    parse: (resp)->
      resp

  API =
    collection: null
    getEmailsCollection: ->
      return @collection if @collection
      @collection = new Entities.EmailsCollection

    getEmails: (url, params = {})->
      emails = @getEmailsCollection()
      emails.url = App.urlRoot + "#{url}"
      emails.fetch reset: true
      emails

    create: (url, params, options) ->
      emails = @getEmailsCollection()
      emails.url = App.urlRoot + "#{url}"
      emails.create params, options
      emails

    update: (url, params, options) ->
      templates = @getEmailsCollection()
      templates.url = App.urlRoot + "#{url}"
      templates.create params, options
      templates

    getEmailModelById: (id)->
      emails = @getEmailsCollection()
      emailModel = emails.get id
      return emailModel if emailModel
      console.error "please visit template from Emails List"


  #    destroy: (url, params) ->
  #      article = @getEmailsCollection().get params.id
  #      article.destroy()
  #      article

  #    show: (url, params) ->
  #      templates = @getEmailsCollection() #new Entities.Articles
  #      template = templates.get params.id
  #      return template if template
  #      template = new Entities.Articles
  #      console.error 'please visit article from the articles list'

  App.reqres.setHandler "emails:show:getEmails", ->
    API.getEmails "emails"
  App.reqres.setHandler "emails:edit:create", (data, options)->
    API.create "emails", data, options
  App.reqres.setHandler "emails.edit:update", (data, options)->
    API.update "emails", data, options
  App.reqres.setHandler "entities:emails:getEmailModelById", (params) ->
    API. getEmailModelById(params)
#  App.reqres.setHandler "article:destroy", (params) ->
#    API.destroy "articles", params
#  App.reqres.setHandler "show:article", (data) ->
#    API.show "articles", data