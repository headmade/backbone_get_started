$ ->

  model = new Backbone.Model name: "Edvatd"

  model.bind "change", ->
    $("#test-content").html JSON.stringify model.toJSON()


  model.trigger "change"



  class ViewClass extends Backbone.View

    _modelBinder: undefined,


    initialize: ->

      #_.bindAll @

      @_modelBinder = new Backbone.ModelBinder


    render: ->

      @setElement "#maf_first_name"

      #@$el.val @model.get "name"

      console.log @_modelBinder

      @_modelBinder.bind @model, @el

      @

    set_log: ->

      console.log 111
      console.log @model.set "name", @$el.val()

    #events:
      #"change": "set_log"


  view = new ViewClass model: model

  #view.render()

  console.log view.render()
