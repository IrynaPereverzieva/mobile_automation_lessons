Before do
  $driver.start_driver
end

After do |scenario|

  if scenario.failed?

    if !File.directory?("screenshots")
      FileUtils.mkdir_p("screenshots")
    end

    time_stamp = Time.now.strftime("%Y-%m-%d_%H.%M.%S")
    screenshot_name = time_stamp + ".png"
    screenshot_file = File.join("screenshots", screenshot_name)
    $driver.screenshot(screenshot_file)
    embed("#{screenshot_file}", "image/png")

  end

  #sleep 3
  $driver.driver_quit

end

# will be executed before each test run once
# if there will be screenshots from the previous test run, they will be deleted
AfterConfiguration do
  FileUtils.rm_r("screenshots") if File.directory?("screenshots")
end

