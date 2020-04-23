THINGS TO DO

- Add nested attributes form for comments
- Add validations
- Fix CSS 
- Fix comments iterator in spots#show
- Add user submittable attribute to CheckIn 
- ADD CHECKIN NOTES NESTED FORM TO LOCATIONS
- Validation messages
- FIX CHECK_IN IN GEOCODE ADDRESS

POSSIBLE SEARCH INPUT<%=text_field_tag('search', nil, placeholder: "Search spots by city")%><br>

<%=f.select :location_id, options_for_select(Location.all.order("country ASC").map{|x| ["#{x.city}, #{x.country}", x.id]}), {:include_blank => 'Select City'}%><br>
