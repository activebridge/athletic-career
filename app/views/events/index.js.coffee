if <%= current_user.present? %>
  $('.events-side').html('<%= j(render partial: "#{params[:type]}_events") %>')
else
  $('.unregistered-user').html('<%= j(render partial: "#{params[:type]}_events") %>')
