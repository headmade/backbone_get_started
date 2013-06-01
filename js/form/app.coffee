String.prototype.capitalize = ->
    @.charAt(0).toUpperCase() + @.slice(1)



class Questionaire extends Backbone.View

  current_step: 1

  events:
    "click .btnClose": "gotoStep(0)"


  initialize: ->

    @collection     = []
    @model          = []



  render: ->

    @model[@current_step]       ||= eval "new TBank.Form#{@current_step}"
    @collection[@current_step]  ||= new ViewClass model: @model[@current_step]

    @collection[@current_step].render()

    if @current_step isnt 1

      $(".formBlock2").show()
      $(".step#{@current_step}").show().siblings().hide()
      $("#other_step_submit").attr "href", "#step#{@current_step + 1}"

    else

      $(".formBlock2").hide()
      $(".step1").show().siblings().hide()
      $("#other_step_submit").attr "href", "#step1"



  gotoStep: (step) =>

    @current_step = step * 1

    @render()



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

