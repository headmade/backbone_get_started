String.prototype.capitalize = ->
    @.charAt(0).toUpperCase() + @.slice(1)


TBank = TBank || {}

class TBank.Layout extends Backbone.View
  views: []
  models: []
  current_step: 1

  render: ->

    @models[@current_step]       ||= eval "new TBank.Form#{@current_step}"
    @views[@current_step]  ||= new ViewClass model: @models[@current_step]

    @views[@current_step].render()
    @afterRender()

  afterRender: ->

  gotoStep: (step) =>

    @current_step = step * 1

    @render()

class Questionaire extends TBank.Layout

  afterRender: ->
    if @current_step isnt 1

      $(".formBlock2").show()
      $(".step#{@current_step}").show().siblings().hide()
      $("#other_step_submit").attr "href", "#step#{@current_step + 1}"

    else

      $(".formBlock2").hide()
      $(".step1").show().siblings().hide()
      $("#other_step_submit").attr "href", "#step1"


class Router extends Backbone.Router
  routes:
      '': 'first_form'
      'step:page': 'gotoStep'
      'maf_close_form': "close_confirm"


  close_confirm: ->

    if confirm "Вы уверены что хотите закрыть анкету?"
      router.navigate "step1", trigger: true
    else
      router.navigate "step#{ questView.current_step }", trigger: false


  first_form: ->

    questView.gotoStep 1
    console.log "1st form"



  gotoStep: (step) ->

    #questmodel.set "current_step", step
    console.log "Form №#{step}"

    questView.gotoStep step


$ ->
  window.questView = new Questionaire
                          el: "#questionnaire"
                          current_step: 1
  questView.render()
  window.router = new Router
  Backbone.history.start()

  #new Masks.Phone $("#maf_mobile_phone")

