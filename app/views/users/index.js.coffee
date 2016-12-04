$('<%= j(render partial: "users", collection: users, as: :user) %>').appendTo($("#list-users"))
if <%= users.last_page? %>
  $('.pagination').html("")
else
  $('.pagination').html("<%=j link_to_next_page(users, '', remote: true) %>")
