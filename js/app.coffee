$ ->

  class Backbone.Form.editors.TbText extends Backbone.Form.editors.Text

    initialize: (options) ->

      console.log @


  


  class User extends Backbone.Model

    schema:
      maf_last_name:
        type: 'Text'
        validators: ['required']
      maf_email:
        type: 'Text'
        validators: ['email', 'required']





  user = new User
    maf_last_name: 'Sterling'
    maf_email: 'sterlingi@sis.com'


  user.bind "change", ->
    console.log "Model has been changed!"


  console.log _.template($('#form_block_1').html())

  form = new Backbone.Form
    template: _.template($('#form_block_1').html())
    model: user

  console.log form.el

  $(".block_bg").append form.render().el

######################
