TBank = {}
TBank.cookieSync = (method, model, options) ->
    console.log method, model, options

class Backbone.Form extends Backbone.Model
    schema: {}
    defaults: ->
        attributes = {}
        for key of @schema
            attributes[key] = @schema[key]['defaults'] || ''
        attributes

    getValidators:(key) ->
        validators = []
        validators = @schema[key]['validators'] if @schema[key]
        validators

    getMask: (key) ->
        @schema[key]["mask"] if @schema[key]

    sync: ->
        TBank.cookieSync.apply @, arguments


