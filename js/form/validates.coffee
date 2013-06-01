Validates = {}

class Validates.Base

  valid: (value) ->
    @regular.test value    



class Validates.Required

  valid: (value) ->
    $.trim(value) isnt '' && value



class Validates.Email extends Validates.Base
  regular: /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/

class Validates.Name extends Validates.Base
  regular: /^[а-яА-ЯёЁ\s-]{2,}$/

class Validates.Phone extends Validates.Base
  regular: /^\+\d\s\([\d]{3}\)\s[\d]{3}\-[\d]{2}\-[\d]{2}$/

class Validates.Date extends Validates.Base
  regular: /^[\d]{2}\.[\d]{2}\.[\d]{4}$/

class Validates.Country extends Validates.Base
  regular: /^[а-яА-ЯёЁ\,\s]{3,}[\s\,а-яА-ЯёЁ]+$/

class Validates.Latinname extends Validates.Base
  regular: /^[a-zA-Z-]{3,}\s[a-zA-Z-]{3,}$/

class Validates.Pasportseria extends Validates.Base
  regular: /^[\d]{2}-?\s?[\d]{2}$/

class Validates.Pasportnumber extends Validates.Base
  regular: /^\d{6}$/

class Validates.Pasportcode extends Validates.Base
  regular: /^\d{3}-?\d{3}$/

class Validates.Simpletext extends Validates.Base
  regular: /^[а-яА-ЯёЁ№0-9,\.\'\"\-\«\»\—\s]{3,}$/

class Validates.Commontext extends Validates.Base
  regular: /^[a-zA-Zа-яА-ЯёЁ№0-9,\.\'\"\-\«\»\—\s]{3,}$/

class Validates.Anytext extends Validates.Base
  regular: /^.{3,}$/

class Validates.Adress extends Validates.Base
  regular: /^[а-яА-Я\.\(\)\s-,0-9]{3,}$/

class Validates.Adressnum extends Validates.Base
  regular: /^[а-яА-Яa-zA-Z\/\(\)\s-,0-9]{1,}$/

class Validates.Number extends Validates.Base
  regular: /^\d{3,}$/

class Validates.Codeword extends Validates.Base
  regular: /^[а-яА-Я]{3,}$/

class Validates.Checkcode extends Validates.Base
  regular: /^\d{5}$/