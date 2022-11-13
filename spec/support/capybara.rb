Capybara.configure do |config|
  config.javascript_driver = :selenium_chrome_headless
  config.default_driver = :selenium_chrome_headless
  config.save_path = "tmp/capybara"
  config.default_max_wait_time = 5
  config.exact = true
  config.match = :smart
  config.ignore_hidden_elements = true
end

Capybara.current_session.current_window.resize_to(1200, 1024)
