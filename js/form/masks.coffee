Masks	= {}


class Masks.Base

  constructor: ($el) ->
    $el.mask @mask


class Masks.Phone extends Masks.Base
  mask: "+7 (999) 999-99-99"

class Masks.Date extends Masks.Base
  mask: "99.99.9999"

class Masks.Pasportseria extends Masks.Base
  mask: "9999"

class Masks.Pasportcode extends Masks.Base
  mask: "999-999"