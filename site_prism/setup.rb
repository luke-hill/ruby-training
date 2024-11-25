# frozen_string_literal: true

require 'bundler'
Bundler.setup

require 'automation_helpers/drivers/local'
require 'capybara'
require 'capybara/dsl'
require 'site_prism'
require 'selenium-webdriver'

class Setup
  class << self
    def setup
      setup_capybara
      setup_site_prism
      setup_selenium_webdriver
      setup_local_driver
    end

    private

    def setup_capybara
      Capybara.configure do |config|
        config.run_server = false
        config.default_driver = :selenium
        config.default_max_wait_time = 0
        config.app_host = 'https://the-internet.herokuapp.com'
      end
    end

    def setup_site_prism
      SitePrism.log_level = log_level
    end

    def setup_selenium_webdriver
      Selenium::WebDriver.logger.level = log_level
    end

    def setup_local_driver
      AutomationHelpers::Drivers::Local.new(browser).register
    end

    def browser
      :chrome
    end

    def log_level
      :ERROR
    end
  end
end
