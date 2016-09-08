$(document).on 'change', ->
  name = $('input[name="career[event][radio_button]"]:checked').data('name')
  year = $('[data-year] option:selected').val()
  organizer = $('[data-organizer] option:selected').val()
  city = $('[data-city] option:selected').val()
  event_name = $('[data-events] option:selected').val()
  showParams(year, name)
  showEvent(city, organizer, year)
  showDistance(event_name)
  $('.organizer-and-city').show()

  $('[data-year]').on 'change', ->
    $("[data-city").prop("selectedIndex", 0)
    $("[data-organizer").prop("selectedIndex", 0)
    $("[data-events]").prop("selectedIndex", 0)
    $("[data-distances]").prop("selectedIndex", 0)
    showParams(year, name)

  $('.career_event_radio_button').on 'change', ->
    $('#organizer_and_city select').hide()
    name = $('input[name="career[event][radio_button]"]:checked').data('name')
    $("[data-#{name}]").show()
    showParams(year, name)

  $('[data-organizer]').on 'change', ->
    $("[data-events]").prop("selectedIndex", 0)
    showEvent(city, organizer, year)

  $('[data-city]').on 'change', ->
    $('.career-event').show()

  $('[data-events]').on 'change', ->
    showDistance(event_name)

  $('[data-distances]').on 'change', ->
    $('.career').show()

showParams = (year, name) ->
  params = "#{name}-#{year}"
  $("[data-#{name}]").children().each ->
    unless $(@).is("[data-#{name}=#{params}]")
      $(@).hide()
    else
      $(@).show()

showEvent = (city, organizer, year) ->
  params = "name-#{city}-#{organizer}-#{year}"
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
