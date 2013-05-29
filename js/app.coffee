$ ->

  class User extends Backbone.Model

    schema:
      title:
        type: "Select"
        options: ["", "Mr", "Mrs", "Ms"]

      name: "Text"
      email:
        validators: ["required", "email"]

      birthday: "Date"
      password: "Password"



  user = new User
    title: "Mr"
    name: "Sterling Archer"
    email: "sterling@isis.com"
    birthday: new Date(1978, 6, 12)
    password: "dangerzone"
    notes: ["Buy new turtleneck", "Call Woodhouse", "Buy booze"]


  form = new Backbone.Form model: user

  $("body").append form.render().el