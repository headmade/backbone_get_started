String.prototype.capitalize = ->
    @.charAt(0).toUpperCase() + @.slice(1)

class Router extends Backbone.Router
  routes:
      '': 'first_form'
      'step:page': 'gotoStep'
      'maf_close_form': "close_confirm"


  close_confirm: ->

    if confirm "Вы уверены что хотите закрыть анкету?"
      @navigate "step1", trigger: true
    else
      @stayOnCurrent()


  first_form: ->

    @gotoStep 1

    #questView.gotoStep 1
    #console.log "1st form"



  gotoStep: (step) ->

    console.log "Form №#{step}"

    step = step * 1

    current_step = questView.current_step

    if current_step < step && ( step - current_step < 2 ) && questView.commitStep(current_step) && step
      console.log "Move to NEXT step"
      questView.gotoStep step

    else if current_step > step && step
      console.log "Move to PREV step"
      questView.gotoStep step

    else
      console.log "Stand on CURRENT step"
      @stayOnCurrent()
      


  stayOnCurrent: ->

    @navigate "step#{ questView.current_step }", trigger: false


    


$ ->
  window.questView = new Questionaire.Layout el: "#questionnaire", current_step: 1
  questView.render()
  window.router = new Router
  Backbone.history.start()

  #new Masks.Phone $("#maf_mobile_phone")

