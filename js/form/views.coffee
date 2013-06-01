class TBank.Layout extends Backbone.View
  views: []
  models: []
  els:[]
  current_step: 1

  render: ->
    model_name = model.__proto__.constructor.name
    @models[@current_step] ||= eval "new TBank.Form#{@current_step}"
    #@views[@current_step]  ||=
    console.log "new #{model_name}.Step#{@current_step}({$el: this.els[this.current_step], model: this.models[this.current_step]})"

    @views[@current_step].render()
    @afterRender()

  afterRender: ->

  gotoStep: (step) =>

    @current_step = step * 1

    @render()

class TBank.StepView extends Backbone.View

  _modelBinder: undefined

  initialize: ->
    _.bindAll @
    @_modelBinder = new Backbone.ModelBinder

  render: ->

    @setElement form_element

    @_modelBinder.bind @model, @el

    for key of @model.attributes
      if mask = @model.getMask key
        eval "new Masks.#{mask.capitalize()}( $('##{key}') )"

    @


  commit: ->
    console.log @model.toJSON()
    if @validate()
        @model.save()

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
