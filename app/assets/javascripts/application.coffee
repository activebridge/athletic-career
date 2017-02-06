#= require jquery
#= require jquery_ujs
#= require jquery-ui
#= require simplemde.min
#= require turbolinks
#= require gmaps/google
#= require lazybox
#= require cloudinary
#= require jquery.datetimepicker.min
#= require jquery.infinite-pages
#= require cocoon
#= require bootstrap-notify
#= require bootstrap-sprockets
#= require highcharts
#= require highcharts/highcharts-more
#= require_tree .

$(document).on 'change', '[data-behavior~=live-update]', ->
  $(@form).trigger 'submit.rails'
  return

$(document).on 'turbolinks:load', ->
  simplemde = new SimpleMDE({ element: document.getElementById('simplemde') })
