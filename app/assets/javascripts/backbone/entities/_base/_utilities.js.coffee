@EmailsApp.module "Entities", (Entities, App, Backbone, Marionette, $, _) ->
	
	App.commands.setHandler "when:fetched", (entities, callback) ->
		xhrs = _.chain([entities]).flatten().pluck("_fetch").value()
		
		$.when(xhrs...).done ->
      console.log 'xhrs done on app.commands'
			callback()