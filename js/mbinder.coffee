String.prototype.capitalize = ->
    @.charAt(0).toUpperCase() + @.slice(1);

  Validates = {}

  class Validates.Required

    valid:(value) ->
        value isnt '' && value

  class Validates.Email

    valid:(value) ->
        /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test value

  class Form1 extends Backbone.Model
    schema:
        maf_first_name:
            validators: ['required']
        maf_last_name:
            validators: ['required']
        maf_email:
            validators: ['email']
        maf_second_name:
            validators: ['required']
        maf_mobile_phone:
            validators: ['required']
        maf_birth_date:
            validators: ['required']
        maf_accept_rules:
            validators: ['required']

    defaults: ->
        attributes = {}
        for key of @schema
            attributes[key] = @schema[key]['defaults'] || ''
        attributes

    getValidators:(key) ->
        validators = []
        validators = @schema[key]['validators'] if @schema[key]
        validators
$ ->

  model = new Form1
  class ViewClass extends Backbone.View

    _modelBinder: undefined

    events:
        "click #first_step_submit": "commit"

    initialize: ->

      @_modelBinder = new Backbone.ModelBinder

    render: ->

      @setElement $(".formBlock1")

      @_modelBinder.bind @model, @el

      @

    commit: ->
      if @validate()
          console.log 'commit'
          $("#test-content").html JSON.stringify model.toJSON()

    validate: ->
      valid = true
      for key of @model.attributes
          valid = @validatefield(key) && valid
      valid

    validatefield:(key)->
      valid = true
      value = @model.get key
      validators = @model.getValidators key
      for validator in validators
          validator = eval "new Validates.#{validator.capitalize()}"
          valid &&= validator.valid(value)
          if valid
            @clearError(key)
          else
            @setError(key)
      valid

    setError:(key) ->
        $("##{key}").parent().addClass('textfieldError')

    clearError:(key) ->
        $("##{key}").parent().removeClass('textfieldError')

  view = new ViewClass model: model

  console.log view.render()
