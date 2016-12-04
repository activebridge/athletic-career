$('<%= j(render partial: "#{params[:type]}_events") %>').appendTo($("#list-events"))
if <%= @events.last_page? %>
  $('.pagination').html("")
else
  $('.pagination').html("<%=j link_to_next_page(@events, '', remote: true) %>")
