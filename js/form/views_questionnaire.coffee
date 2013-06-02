Questionaire = {}
class Questionaire.Layout extends TBank.Layout
  els: ['.formBlock1', '#maf_full_form_main .step1', '#maf_full_form_main .step2', '#maf_full_form_main .step3']
  namespace: 'Questionaire'

  events:
    'click #first_step_submit': "toSecondStep"


  toSecondStep:  ->
    if @commitStep 1
      router.navigate "step2", trigger: true


  afterRender: ->

    step = @current_step

    @setProgressbar step

    switch step
      when 1
        $(".formBlock2").hide()
        $("#first_step_submit").show()
        $(".sendAgain").hide()
        $(".step1").show().siblings().hide()
        $("#other_step_submit").attr "href", "#step1"

      when 2
        $(".formBlock2").slideDown(300)
        $("#first_step_submit").hide()
        $(".sendAgain").show()
        $(".step1").show().siblings().hide()
        $("#other_step_submit").attr "href", "#step3"
        $("#prev_step_submit").hide()

      when 3
        $(".formBlock2").slideDown(300)
        $("#first_step_submit").hide()
        $(".sendAgain").show()
        $(".step2").show().siblings().hide()
        $("#other_step_submit").attr "href", "#step4"
        $("#prev_step_submit").attr("href", "#step2").show()

      when 4
        $(".formBlock2").slideDown(300)
        $("#first_step_submit").hide()
        $(".sendAgain").show()
        $(".step3").show().siblings().hide()
        $("#other_step_submit").attr "href", "#step4"
        $("#prev_step_submit").attr("href", "#step3").show()


  setProgressbar: (step) ->

    p_width = 75 + 235 * ( step - 1 )

    $(".switcher .progress").animate 
      width: p_width
      , "slow"
      , ->
        $(".switcherBlock").find(".item").removeClass("activeSwitcher").eq(step - 1).addClass "activeSwitcher"


class Questionaire.Step1 extends TBank.StepView
class Questionaire.Step2 extends TBank.StepView
class Questionaire.Step3 extends TBank.StepView
class Questionaire.Step4 extends TBank.StepView
