$('#list-events').append('<%= j(render partial: "#{params[:type]}_events") %>')
if <%= search_event.last_page? %>
  $('.pagination').html("That's all, folks!")
else
  $('.pagination').html("<%=j link_to_next_page(search_event, 'Next Page', remote: true) %>")
