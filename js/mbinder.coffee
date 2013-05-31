String.prototype.capitalize = ->
    @.charAt(0).toUpperCase() + @.slice(1);

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

$ ->
  model = new Form1
  view = new ViewClass model: model
  console.log view.render()
