require 'capybara'
require 'capybara/cucumber'
require 'capybara/poltergeist'
require 'capybara-screenshot/cucumber'

Capybara.configure do |config|
  config.app_host = ENV['APP_HOST'] || 'http://web_1:8080'
end

if ENV['IN_BROWSER']
  Capybara.default_driver = :selenium
  AfterStep do
    sleep (ENV['PAUSE'] || 0).to_i
  end
else
  Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(
      app,
      window_size: [1280, 1024]#,
      #debug:       true
    )
  end
  Capybara.default_driver    = :poltergeist
  Capybara.javascript_driver = :poltergeist
end

current_path = File.dirname(__FILE__)
Capybara.save_path = "#{current_path}/../../screenshots"
Capybara::Screenshot.prune_strategy = { keep: 3 }

Before do |scenario|
  visit('/')
end

World(Capybara)
