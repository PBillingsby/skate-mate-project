THINGS TO DO

- Validation messages for spots
- FIX SPOT SHOW CONTROLLER TO NOT INCLUDE @SPOT.COMMENTS.BUILD NIL VALUE
# LOCATION WORKS WITH CHECK IN But NOT WITH SPOT CREATE ##### FIXXXXXXX
# NO FORMS HAVE A LOCATION ID NOW

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