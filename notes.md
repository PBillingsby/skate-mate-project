<%if current_user%>
  <h4>Hey, <%=current_user.username%>. Want to visit your profile? Click <%=link_to "here", user_path(current_user)%></h4>
<%end%> <-----INDEX>

APPLICATION.HTML.ERB
<ul class="nav-bar">
    <%if current_user%>
      <li><%=button_to "Profile", user_path(current_user), method: :get%></li>
      <li><%=button_to "Log Out", logout_path, action: :delete%></li>
    <%end%></ul><br>