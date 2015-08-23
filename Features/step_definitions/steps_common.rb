Given(/^I am on search page$/) do
  navigate_to_home_page
end

Then(/^"([^"]*)" placeholder is "([^"]*)"$/) do |fieldname, placeholder|
  verify_placeholder(fieldname, placeholder)
end

Then(/^"([^"]*)" field is displayed$/) do |field|
  field_visible?(field).should == true
end