THINGS TO DO

- Add nested attributes form for comments
- Fix comments iterator in spots#show
- Validation messages
- FIX USER#SHOW 'YOUR SPOTS' TO ADD SPOTS, OR NEW FORM.


POSSIBLE SEARCH INPUT<%=text_field_tag('search', nil, placeholder: "Search spots by city")%><br>

<%=simple_form_for :spot, url: user_spots_path(current_user), :method => :post do |f|%>
    <%= f.hidden_field :user_id, :value => @user.id %>
    <%if !params[:location_id]%>
      <%=f.fields_for :location do |ff|%>
        <%=ff.text_field :city, placeholder: :city%><br>
        <%=ff.select :location_id, options_for_select(Location.all.order("city ASC").uniq.map{|x| ["#{x.city}", x.id]}), {:include_blank => 'Select City'}%><br>
      <%end%>
    <%end%>
    <%=render 'spots/form', f:f%>
  <%end%><br>