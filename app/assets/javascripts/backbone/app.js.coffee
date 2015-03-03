@EmailsApp = do (Backbone, Marionette) ->

	App = new Marionette.Application



	App.addRegions
    headerRegion: 	"#header-region"
    mainRegion:			"#main-region"
    footerRegion:		"#footer-region"
    dialogRegion: Marionette.Region.Dialog.extend el: "#dialog-region"


  App.urlRoot="emails/"
	App.rootRoute = ""

	App.reqres.setHandler "default:region", ->
		App.mainRegion

	App.addInitializer ->
    console.log 'app js init'

#		App.module("HeaderApp").start()
#		App.module("FooterApp").start()
	
#	App.commands.setHandler "register:instance", (instance, id) ->
#		App.register instance, id
#
#	App.commands.setHandler "unregister:instance", (instance, id) ->
#		App.unregister instance, id
#
#	App.on "initialize:after", (options) ->
#    console.log 'app js init1'
#

  App.on "start", ->
    @startHistory()
    @navigate(@rootRoute, trigger: true) unless @getCurrentRoute()

	App


