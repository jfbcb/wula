# DocPad Configuration File
# http://docpad.org/docs/config

# Define the DocPad Configuration
docpadConfig = {
	
	outPath:'outs'

	templateData:
		site:
			branch: 'master'
			version: '1.0.0-beta'

		qqgroups: [
				{qq:'371487281',num:1}
		]

	collections:
    	pages: ->
            @getCollection("html").findAllLive({isPage:true})
	plugins:
		lunr:
			indexes:
				myIndex:
					collection: 'myCollection'
		ghpages:
        	deployRemote: 'target'
        	deployBranch: 'gh-pages'

	events:
		extendCollections: (opts) ->
			@docpad.getCollection('files').on('add', (document) ->
				document.setMetaDefaults(standalone:true))    
			@docpad.getCollection('stylesheet').on('add', (document) ->
				document.setMetaDefaults(standalone:true))           
		
}

# Export the DocPad Configuration
module.exports = docpadConfig
