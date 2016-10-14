$(document).on 'change', ->
  $('form#new_competition').on 'change', ->
    $submit = $('input[type=submit]')
    $inputs = $('#competition_distance_id, #competition_race_number, select')

    checkEmpty = ->
      $inputs.filter(->
        !$.trim(@value)
      ).length == 0

    $inputs.on('blur', ->
      $submit.prop 'disabled', !checkEmpty()
    ).blur()
