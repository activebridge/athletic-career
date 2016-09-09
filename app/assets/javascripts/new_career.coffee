$(document).on 'change', ->
  # name = $('input[name="career[event][radio_button]"]:checked').data('name')
  year = $('[data-year] option:selected').val()
  # organizer = $('[data-organizer] option:selected').val()
  city = $('[data-city] option:selected').val()
  event_name = $('[data-events] option:selected').val()
  showParams(year, name)
  showEvent(city, year)
  showDistance(event_name)

  $('[data-year]').on 'change', ->
    $('.organizer-and-city').show()
    $("[data-city").prop("selectedIndex", 0)
    # $("[data-organizer").prop("selectedIndex", 0)
    $("[data-events]").prop("selectedIndex", 0)
    $("[data-distances]").prop("selectedIndex", 0)
    showParams(year, name)

  # $('.career_event_radio_button').on 'change', ->
    # $('#organizer_and_city select').hide()
    # name = $('input[name="career[event][radio_button]"]:checked').data('name')
    # $("[data-#{name}]").show()
    # showParams(year, name)

  $('[data-city]').on 'change', ->
    $('.career-event').show()
    $("[data-events]").prop("selectedIndex", 0)
    showEvent(city, year)

  $('[data-events]').on 'change', ->
    $('.career').show()
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
