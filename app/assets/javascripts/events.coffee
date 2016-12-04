$(document).on 'page:change ready page:load', ->
  $('#list-events').infinitePages('next')
    loading: ->
      $(this).text('Loading next page...')
    error: ->
      $(this).button('There was an error, please try again')
