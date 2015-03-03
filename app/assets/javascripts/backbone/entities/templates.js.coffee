@EmailsApp.module "Entities", (Entities, App, Backbone, Merionette, $, _) ->

  class Entities.TemplatesModel extends Entities.Model

  class Entities.TemplatesCollection extends Entities.Collection
    model: Entities.TemplatesModel
    parse: (resp)->
      resp

  API =
    collection: null
    getEmailsCollection: ->
      return @collection if @collection
      @collection = new Entities.TemplatesCollection

    getTemplates: (url, params = {})->
      templates = @getEmailsCollection()
      templates.url = App.urlRoot + "#{url}"
      templates.fetch reset: true
      templates

    create: (url, params, options) ->
      templates = @getEmailsCollection()
      templates.url = App.urlRoot + "#{url}"
      templates.create params, options
      templates

    update: (url, params, options) ->
      templates = @getEmailsCollection()
      templates.url = App.urlRoot + "#{url}"
      templates.create params, options
      templates

    getTemplateModelById: (id)->
      templates = @getEmailsCollection()
      templateModel = templates.get id
      return templateModel if templateModel
      console.error "please visit template from Template Manager"


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

  App.reqres.setHandler "templates:templates:getEmails", ->
    API.getTemplates "templates"
  App.reqres.setHandler "templates:edit:create", (data, options)->
    API.create "templates", data, options
  App.reqres.setHandler "templates:edit:update", (data, options)->
    API.update "templates", data, options
  App.reqres.setHandler "templates:getEmails:model:by:id", (params) ->
    API. getTemplateModelById(params)
#  App.reqres.setHandler "article:destroy", (params) ->
#    API.destroy "articles", params
#  App.reqres.setHandler "show:article", (data) ->
#    API.show "articles", data