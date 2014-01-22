@remove_fields = (link) ->
  $(link).prev("input[type=hidden]").val("1")
  $(link).closest(".fields").hide()

@add_fields= (link, association, content, container_selector) ->
  new_id = new Date().getTime()
  regexp = new RegExp("new_" + association, "g")
  if container_selector == ''
    $(link).parent().before(content.replace(regexp, new_id))
  else
    $(link).closest('form').find(container_selector).append(content.replace(regexp, new_id))

@initSelect2 = () ->
  $('form select').select2()

