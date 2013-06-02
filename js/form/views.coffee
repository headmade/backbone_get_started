class TBank.Layout extends Backbone.View
  views: []
  models: []
  els:[]
  namespace: ''
  current_step: 1


  render: ->

    @models[@current_step - 1] ||= eval "new TBank.Form#{@current_step}"
    @views[@current_step- 1]  ||= eval "new #{@namespace}.Step#{@current_step}({el: '#{@els[@current_step-1]}', model: this.models[this.current_step - 1] })"
    @views[@current_step- 1].render()
    @afterRender()


  afterRender: ->


  gotoStep: (step) =>

    @current_step = step * 1

    @render()


  commitStep: (step) =>

    @views[step - 1].commit()



class TBank.StepView extends Backbone.View

  _modelBinder: undefined

  initialize: ->
    _.bindAll @
    @_modelBinder = new Backbone.ModelBinder

  render: ->

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
