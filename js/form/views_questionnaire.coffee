Questionaire = {}
class Questionaire.Layout extends TBank.Layout
  els: ['.formBlock1']
  namespace: 'Questionaire'

  afterRender: ->
    if @current_step isnt 1

      $(".formBlock2").show()
      $(".step#{@current_step}").show().siblings().hide()
      $("#other_step_submit").attr "href", "#step#{@current_step + 1}"

    else

      $(".formBlock2").hide()
      $(".step1").show().siblings().hide()
      $("#other_step_submit").attr "href", "#step1"

class Questionaire.Step1 extends TBank.StepView
class Questionaire.Step2 extends TBank.StepView
class Questionaire.Step3 extends TBank.StepView
