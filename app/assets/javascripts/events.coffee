$(document).on 'page:change', ->
  $(window).scroll ->
    trigger = $('.events-side')[0]
    scroll = @.scrollTop || @.scrollY
    offset = $(@).data('offset') || $('body').data('offset') || 100
    if (trigger && trigger.offsetTop - offset < scroll + $(@).height())
      $(trigger).click()
