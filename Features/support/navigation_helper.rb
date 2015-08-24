def get_id_by_fieldname(fieldname)
  case fieldname.downcase!
    when 'pickup location', 'pickuplocation', 'pick up location'
      id = 'PickupLocation'
    when 'dropoff location', 'dropofflocation', 'drop off location'
      id = 'DropoffLocation'
    when 'pickup date', 'pickupdate', 'pick up date'
      id = 'PickupDate'
    when 'dropoff date', 'dropoffdate', 'drop off date'
      id = 'DropoffDate'
    when 'forename'
      id = 'Forename'
    when 'surname'
      id = 'Surname'
    when 'age'
      id = 'Age'
    else
      puts "\nField '#{fieldname}' was not recognised."
  end
  id
end

def verify_placeholder(fieldname, placeholder)
  @driver.find_element(id: get_id_by_fieldname(fieldname)).attribute('placeholder').should == placeholder
end

def field_visible?(fieldname)
  visible = true
  id = get_id_by_fieldname(fieldname)
  # Check is element is present
  wait_for(1) { visible = element_present?(:id, id) }
  return unless visible

  # Check if element is visible
  wait_for(1) { visible = @driver.find_element(id: id).displayed? }
  visible
end

def wait_for(seconds)
  Selenium::WebDriver::Wait.new(timeout: seconds).until { yield }
end

def type_pickup_location(term)
  @driver.find_element(id: 'PickupLocation').clear
  @driver.find_element(id: 'PickupLocation').send_keys "#{term}"
end

def type_dropoff_location(term)
  @driver.find_element(id: 'DropoffLocation').clear
  @driver.find_element(id: 'DropoffLocation').send_keys '#{term}'
end

def click_search
  @driver.find_element(xpath: ".//*[@id='search-form']/button").click
end

def click_reserve
  @driver.find_element(css: '.table tbody tr:nth-of-type(1) td:nth-of-type(3) a').click
end

def offer_table_displayed?
  return false unless element_present?(:css, '.table')
  # table should have correct column names (otherwise it is not offer table)
  return false unless @driver.find_element(css: '.table thead tr th:nth-of-type(1)').text == 'Car'
  return false unless @driver.find_element(css: '.table thead tr th:nth-of-type(2)').text == 'Price'
  # table should have at least one row with values
  return false unless element_present?(:css, '.table tbody tr:nth-of-type(1)')
  return false if @driver.find_element(css: '.table tbody tr:nth-of-type(1) td:nth-of-type(1)').text.empty?
  return false if @driver.find_element(css: '.table tbody tr:nth-of-type(1) td:nth-of-type(2)').text.empty?
  # Reserve button should be displayed
  return false unless element_present?(:css, '.table tbody tr:nth-of-type(1) td:nth-of-type(3) a')
  return false unless @driver.find_element(css: '.table tbody tr:nth-of-type(1) td:nth-of-type(3) a').text == 'Reserve'
  true
end

def reservation_form_displayed?
  return false unless element_present?(:id, 'reservation-form')
  true
end

