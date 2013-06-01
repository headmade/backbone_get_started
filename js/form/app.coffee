String.prototype.capitalize = ->
    @.charAt(0).toUpperCase() + @.slice(1)



$ ->
  model = new Form1
  view = new ViewClass model: model
  console.log view.render()

  #new Masks.Phone $("#maf_mobile_phone")

