String.prototype.capitalize = ->
    @.charAt(0).toUpperCase() + @.slice(1)

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
  console.log Questionaire
  window.questView = new Questionaire.Layout el: "#questionnaire", current_step: 1
  questView.render()
  window.router = new Router
  Backbone.history.start()

  #new Masks.Phone $("#maf_mobile_phone")

