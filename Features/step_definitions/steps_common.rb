Given(/^I am on search page$/) do
  navigate_to_home_page
end

Then(/^"([^"]*)" placeholder is "([^"]*)"$/) do |fieldname, placeholder|
  verify_placeholder(fieldname, placeholder)
end

Then(/^"([^"]*)" field is displayed$/) do |field|
  field_visible?(field).should == true
end

And(/^I specify search criteria and make a search$/) do
  type_pickup_location("Tallinn")
  type_dropoff_location("Hamburg")
  # Dates should be specified here when they are added to the page
  click_search
end

Then(/^I get offer list with Reserve buttons$/) do
  offer_table_displayed?.should == true
end

When(/^I click Reserve$/) do
  click_reserve
end

Then(/^I am taken to the reservation form$/) do
  reservation_form_displayed?.should == true
end