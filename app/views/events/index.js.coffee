$('#list-events').append('<%= j(render partial: "#{params[:type]}_events") %>')
if "<%= notifications.next_page %>"
  $('.events-side').attr('href', '<%= event_path(page: params[:page].to_i + 1, type: "#{params[:type]}") %>')
else
  $('.events-side').remove()
