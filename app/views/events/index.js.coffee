$('.events-side').html('<%= j(render partial: "#{params[:type]}_events") %>')
unless <%= search_event.last_page? %>
  $('.pagination').html("<%=j link_to_next_page(search_event, '', remote: true) %>")
