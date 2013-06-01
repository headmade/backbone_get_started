window.TBank = TBank = {}

TBank.cookieSync = (method, model, options) ->
    $.cookie.json = true
    model_name = model.__proto__.constructor.name
    switch method
        when 'read'
            attributes = $.cookie model_name
            if attributes
                model.attributes = attributes
        when 'create'
            $.cookie model_name, model.toJSON()

class Backbone.Form extends Backbone.Model
    schema: {}
    defaults: ->
        attributes = {}
        for key of @schema
            attributes[key] = @schema[key]['defaults'] || ''
        attributes

    initialize:(options) ->
        super options
        @.fetch()

    getValidators:(key) ->
        validators = []
        validators = @schema[key]['validators'] if @schema[key]
        validators

    getMask: (key) ->
        @schema[key]["mask"] if @schema[key]

    sync: ->
        TBank.cookieSync.apply @, arguments


