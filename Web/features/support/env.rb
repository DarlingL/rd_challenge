require 'capybara/cucumber'
require 'faker'
require 'selenium-webdriver'
require 'site_prism'
require 'rspec'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app,
  :browser => :chrome,
  :options => Selenium::WebDriver::Chrome::Options.new(
    args: %w[headless no-sandbox disable-gpu disable-dev-shm-usage window-size=1280x720]
  )
)
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 10