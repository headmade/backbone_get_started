$ ->

  model = new Backbone.Model
    maf_last_name:  ""
    maf_first_name: ""
    maf_second_name: ""

  model.bind "change", ->
    $("#test-content").html JSON.stringify model.toJSON()


  model.trigger "change"



  class ViewClass extends Backbone.View

    _modelBinder: undefined,


    initialize: ->

      @_modelBinder = new Backbone.ModelBinder


    render: ->

      @setElement $(".formBlock1")

      @_modelBinder.bind @model, @el

      @



  view = new ViewClass model: model

  console.log view.render()
