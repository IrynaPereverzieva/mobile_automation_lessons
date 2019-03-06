Then("Left Unit picker value should be {string}") do |left_unit|
  left_picker_text = find_elements(id: "select_unit_spinner")[0].text
    if left_picker_text != left_unit
    fail("Expected unitpicker value is #{left_unit}, acual value is #{left_picker_text}")
  end
  end

And("Right Unit picker value should be {string}") do |right_unit|
  right_picker_text = find_elements(id: "select_unit_spinner")[1].text
  if right_picker_text != right_unit
    fail("Expected unitpicker value is #{right_unit}, acual value is #{right_picker_text}")
  end
end

Given(/^Show All button is (enabled|disabled)$/) do |state|
  button_state = find_element(id: "btn_show_all").enabled?

  if state == "enabled"
    # button_state == true
    fail("Expected to be true") if button_state != true
  elsif state == "disabled"
    # button_state == false
    fail("Expected to be false") if button_state != false
  end

end

When("I tap on Clear button") do
  puts("Clear button is tapped")
end

Then(/^I should see result as "([^"]*)"$/) do |result|
  actual_result = find_element(id: "target_value").text
  if actual_result != result
    fail("Expected result value is #{result}, acual value is #{actual_result}")
  end
end

When(/^I type "([^"]*)" on application keyboard$/) do |target|
   digits = target.split("")
   digits.each do |num|
     puts(num)
     find_element(id: "keypad").find_element(xpath: "//android.widget.Button[@text='#{num}']").click
   end
end

When(/^I tap on Add to Favorites icon$/) do
  find_element(id: "action_add_favorites").click
end

And(/^I tap on Favorite conversions$/) do
  text("Favorite conversions").click
end

And(/^I verify "([^"]*)" added to Favorite conversions list$/) do |favorites_item|
  actual_favourites_item = find_element(id: "favorites_item_hint").text
  fail("Cannot find #{favorites_item} in Favourite List") if actual_favourites_item != favorites_item
end

When(/^I tap on search icon$/) do
  find_element(id: "action_search").click
end

And(/^I type "([^"]*)" in search field$/) do |text|
  find_element(id: "search_src_text").send_keys(text)
end

And(/^I tap on Return button on soft keyboard$/) do
  Appium::TouchAction.new.tap(x:0.99, y:0.99, count: 1).perform
end

Then(/^I see "([^"]*)" as current unit converter$/) do |current_unit|
  
  #binding.pry

  find_element(id: "action_bar").find_element(xpath: "//android.widget.TextView[@text='#{current_unit}']")
end

And(/^I select "([^"]*)" from left unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[0].click
  find_in_list(value)
end

And(/^I select "([^"]*)" from menu$/) do |value|
  text(value).click
end

And(/^I select "([^"]*)" from right unit picker$/) do |value|
  find_elements(id: "select_unit_spinner")[1].click
  find_in_list(value)
end

When(/^I tap on switch units button$/) do
  find_element(id: "img_switch").click
end

Then("I should see text {string}") do |value|
  text(value)
end

Then(/^I verify that (\d+)(?:st|nd|rd|th)? result in history list is "([^"]*)"$/) do |index, text|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line") # will return an array
  actual_text = array_of_elements[index.to_i - 1].find_element(id: "history_item_hint").text

  if actual_text != text
    fail("Expected text is #{text}, actual text is #{actual_text}")
  end

end

When(/^I press delete from history at (\d+)(?:st|nd|rd|th)? row$/) do |index|
  parent_element = find_element(id: "history_conversion_list")
  array_of_elements = parent_element.find_elements(id: "history_single_line")
  array_of_elements[index.to_i - 1].find_element(id: "deleteIcon").click
end