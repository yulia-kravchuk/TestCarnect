def type_pickup_location(term)
  @driver.find_element(:id, "PickupLocation").clear
  @driver.find_element(:id, "PickupLocation").send_keys "#{term}"
end

def get_id_by_fieldname(fieldname)
  case fieldname.downcase!
    when "pickup location", "pickuplocation", "pick up location"
      id = "PickupLocation"
    when "dropoff location", "dropofflocation", "drop off location"
      id = "DropoffLocation"
    when "pickup date", "pickupdate", "pick up date"
      id = "PickupDate"
    when "dropoff date", "dropoffdate", "drop off date"
      id = "DropoffDate"
    else
      puts "\nField was not recognised."
  end
  id
end

def verify_placeholder(fieldname, placeholder)
  @driver.find_element(:id, get_id_by_fieldname(fieldname)).attribute('placeholder').should == placeholder
end

def field_visible?(fieldname)
  # Check is element is present
  wait_for(1) {visible = element_present?(:id, get_id_by_fieldname(fieldname))}
  return unless visible

  # Check if element is visible
  wait_for(1) { visible = @driver.find_element(:id, get_id_by_fieldname(fieldname)).displayed? }
  visible
end

def wait_for(seconds)
  Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
end
