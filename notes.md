<%if current_user%>
  <h4>Hey, <%=current_user.username%>. Want to visit your profile? Click <%=link_to "here", user_path(current_user)%></h4>
<%end%> <-----INDEX>

APPLICATION.HTML.ERB
<ul class="nav-bar">
    <%if current_user%>
      <li><%=button_to "Profile", user_path(current_user), method: :get%></li>
      <li><%=button_to "Log Out", logout_path, action: :delete%></li>
    <%end%></ul><br>

USER SHOW
<%if !@user.location%>
    Where are you today?
    <%=form_for @location, method: 'post' do |f|%>
      <%= f.hidden_field :user_id, value: current_user.id %>
      <%=f.label :city%>
      <%=f.text_field :city%>
      <%=f.label :state%>
      <%=f.text_field :state%>
      <%=f.label :country%>
      <%=f.text_field :country%>
      <%=f.submit "Add Your Location"%>
    <%end%>
  <%else%>
    <p>You're  currently in <%= @user.location.city%>, <%=@user.location.country%>
  <%end%>

  SPOT RATINGS
    <%= f.input :rating, collection: 1..10 %>

    <%@spot.rating.times do  %>
 <%= octicon "star" %>
<% end %>
