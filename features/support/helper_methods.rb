def select_unit_picker_value(unit_picker_value)
  3.times {Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.2, end_x: 0.5, end_y: 0.8, duration: 600).perform }

  current_screen = get_source
  previous_screen = ""

  until ( exists{ text(unit_picker_value)} ) || (current_screen == previous_screen) do
    Appium::TouchAction.new.swipe(start_x: 0.5, start_y: 0.8, end_x: 0.5, end_y: 0.2, duration: 600).perform
    previous_screen = current_screen
    current_screen = get_source
  end

  if exists{ text(unit_picker_value)}
    text(unit_picker_value).click
  else
    fail("Can not find element #{unit_picker_value}")
  end

end