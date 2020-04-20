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

<%if loc.spots.count > 1%>
      <%=form_for(loc) do |f|%>
        <li><%=f.collection_select :spots, :spot_id, loc.spots, :id, :name%></li>
        <li><%=f.submit "View Spot"%></li><br>
      <%end%>
    <%end%><br>

    <h3>Search spot by city</h3>
    <%=form_tag(spots_path, :method => "get") do%>
      <%=text_field_tag :search, params[:search]%>
      <%=submit_tag "Search Spots"%>
    <%end%>

     <%=label_tag "Rating"%>
      <%=select_tag :search_rating, options_for_select((1..5)), prompt: "-"%><br>

      <%=collection_select :location, :city, Location.all.map{|c|["#{c.city}, #{c.country}"]}, :id, :country%><br>
