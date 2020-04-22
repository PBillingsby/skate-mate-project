THINGS TO DO

- Add nested attributes form for comments
- Add validations
- Fix CSS 
- Fix comments iterator in spots#show
- Add user submittable attribute to CheckIn
- User helper method in conditional in spotscontroller#index
- Validation messages

POSSIBLE SEARCH INPUT<%=text_field_tag('search', nil, placeholder: "Search spots by city")%><br>

<%=f.select :location_id, options_for_select(Location.all.order("country ASC").map{|x| ["#{x.city}, #{x.country}", x.id]}), {:include_blank => 'Select City'}%><br>
