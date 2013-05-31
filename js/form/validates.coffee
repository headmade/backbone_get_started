Validates = {}

class Validates.Required

    valid:(value) ->
        value isnt '' && value

class Validates.Email

    valid:(value) ->
        /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i.test value
