Given("I land on home screen") do
  find_element(id: "action_search")
  find_element(id: "action_add_favorites")
end

When("I tap on Menu icon") do
  find_element(accessibility_id: "Open navigation drawer").click
end

Then("I should see left side menu") do
  text("Unit Converter")
end

And("I tap on My conversions icon") do
  text("My conversions").click
end

Then("I land on My conversions screen") do
  text("My conversions")
end