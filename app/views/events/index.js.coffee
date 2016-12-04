$('<%= j(render partial: "#{params[:type]}_events") %>').appendTo($("#list-events"))
if <%= past_events.last_page? %>
  $('.pagination').html("That's all, folks!")
else
  $('.pagination').html("<%=j link_to_next_page(past_events, '', remote: true) %>")
