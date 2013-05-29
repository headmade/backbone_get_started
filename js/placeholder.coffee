$ ->

  $("input").each ->
    $this = $(this)
    $this.attr "placeholder", $this.attr "hint"