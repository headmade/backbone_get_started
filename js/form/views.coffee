class ViewClass extends Backbone.View

  _modelBinder: undefined

  events:
      "click #first_step_submit": "commit"


  initialize: ->

    _.bindAll @

    @_modelBinder = new Backbone.ModelBinder


  render: ->

    @setElement $(".formBlock1")

    @_modelBinder.bind @model, @el

    for key of @model.attributes
      if mask = @model.getMask key
        eval "new Masks.#{mask.capitalize()}( $('##{key}') )"

    @


  commit: ->
    console.log @model.toJSON()
    if 1# @validate()
        console.log 'commit'
        @model.save()
        router.navigate "step2", trigger: true
        $("#test-content").html JSON.stringify @model.toJSON()


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

    $label  = $("##{key}_label")

    if $label.length

      $label.addClass "accessError"

    else

      $("##{key}").parent().addClass('textfieldError')


  clearError:(key) ->

    $label  = $("##{key}_label")

    if $label.length

      $label.removeClass "accessError"

    else

      $("##{key}").parent().removeClass('textfieldError')
