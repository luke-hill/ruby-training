# frozen_string_literal: true

require 'ca_testing'
require 'capybara'
require 'site_prism'
require 'selenium-webdriver'

class Setup
  def initialize
    setup_capybara
    setup_site_prism
    setup_selenium_webdriver
    setup_driver
  end

  def setup_capybara
    Capybara.configure do |config|
      config.run_server = false
      config.default_driver = :selenium
      config.default_max_wait_time = 0
      config.app_host = 'https://the-internet.herokuapp.com'
    end
  end

  def setup_site_prism
    SitePrism.configure do |config|
      config.log_level = :DEBUG

      # This will be required until v4 of SitePrism is released
      require 'site_prism/all_there'
      config.use_all_there_gem = true
    end
  end

  def setup_selenium_webdriver
    Selenium::WebDriver.logger.level = :DEBUG
  end

  def setup_driver
    CaTesting::Drivers::Local.new(browser).register
  end
end
