# $('.events-side').html('<%= j(render partial: "#{params[:type]}_events") %>')
unless <%= past_events.last_page? %>
  $('.raw.pagination').html("<%=j link_to_next_page(past_events, '', remote: true) %>")
