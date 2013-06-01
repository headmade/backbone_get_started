String.prototype.capitalize = ->
    @.charAt(0).toUpperCase() + @.slice(1)
class Router extends Backbone.Router
    routes:
        '': 'first_form'
        'form2': 'second_form'
    first_form:->
         model = new Form1
         view = new ViewClass model: model
         view.render()

    second_form:->
         console.log "second_form"
         model = new Form2

$ ->
  window.router = new Router
  Backbone.history.start()

  #new Masks.Phone $("#maf_mobile_phone")

