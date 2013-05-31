Validates = {}

class Validates.Base

  regular: /^([a-zA-Z0-9_\.\-])$/

  valid: (value) ->
    @regular.test value    



class Validates.Required

  valid: (value) ->
    value isnt '' && value



class Validates.Email extends Validates.Base

  regular: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/