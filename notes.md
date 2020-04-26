THINGS TO DO

- Validation messages for spots
- FIX SPOT SHOW CONTROLLER TO NOT INCLUDE @SPOT.COMMENTS.BUILD NIL VALUE
# LOCATION WORKS WITH CHECK IN But NOT WITH SPOT CREATE ##### FIXXXXXXX
# NO FORMS HAVE A LOCATION ID NOW

POSSIBLE SEARCH INPUT<%=text_field_tag('search', nil, placeholder: "Search spots by city")%><br>

LOCATION FORM
<%=simple_form_for @location do |f|%>
  <%=render 'layouts/shared_errors', form_object:@location%>
  <%= f.hidden_field :user_id, :value => @user.id %>
  <%=f.text_field :city, placeholder: "Enter major city"%>
  <%=f.fields_for :check_in%>
  <%=f.submit "Check In"%>
<%end%>