String.prototype.capitalize = ->
    @.charAt(0).toUpperCase() + @.slice(1);

$ ->
  Validates = {}

  class Validates.Required

    valid:(value) ->
        value isnt ''

  class Form1 extends Backbone.Model
    schema:
        maf_first_name:
            validators: ['required']

    getValidators:(key) ->
        validators = []
        validators = @schema[key]['validators'] if @schema[key]
        validators

  model = new Form1
    maf_last_name:  ""
    maf_first_name: ""
    maf_second_name: ""

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
          valid &&= @validatefield(key)
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
