$(document).on 'change', ->
  $('form#new_competition').on 'change', ->
    $submit = $('input[type=submit]')
    $inputs = $('input[type=number], select')

    checkEmpty = ->
      $inputs.filter(->
        !$.trim(@value)
      ).length == 0

    $inputs.on('blur', ->
      $submit.prop 'disabled', !checkEmpty()
    ).blur()

  year = $('[data-year] option:selected').val()
  city = $('[data-city] option:selected').val()
  event_name = $('[data-events] option:selected').val()
  showParams(year, name)
  showEvent(city, year)
  showDistance(event_name)

  $('[data-year]').on 'change', ->
    $('.organizer-and-city').show()
    $("[data-city").prop("selectedIndex", 0)
    $("[data-events]").prop("selectedIndex", 0)
    $("[data-distances]").prop("selectedIndex", 0)
    showParams(year, name)

  $('[data-city]').on 'change', ->
    $('.competition-event').show()
    $("[data-events]").prop("selectedIndex", 0)
    showEvent(city, year)

  $('[data-events]').on 'change', ->
    $('.competition').show()
    showDistance(event_name)

showParams = (year) ->
  params = "city-#{year}"
  $("[data-city").children().each ->
    unless $(@).is("[data-city=#{params}]")
      $(@).hide()
    else
      $(@).show()

showEvent = (city, year) ->
  params = "name-#{city}-#{year}"
  $('[data-events]').children().each ->
    unless $(@).is("[data-event=#{params}]")
      $(@).hide()
    else
      $(@).show()

showDistance = (event_name) ->
  params = "distance-#{event_name}"
  $('[data-distances]').children().each ->
    unless $(@).is("[data-distance=#{params}]")
      $(@).hide()
    else
      $(@).show()
