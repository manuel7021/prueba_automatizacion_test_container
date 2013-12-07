# coding: utf-8
require 'capybara/rspec'
require 'yaml'
require 'net/http'
require 'json'

RSpec.configure do |config|
  #Capybara configurations
  Capybara.ignore_hidden_elements = true
  Capybara.default_wait_time = 10
  Capybara.default_driver = :selenium
  Capybara.javascript_driver = :selenium
  config.include Capybara::DSL
  yml_config = YAML.load_file 'config.yml'
  
  # Use color in STDOUT
  config.color_enabled = true

  # Use color not only in STDOUT but also in pagers and files
  config.tty = true

  # Use the specified formatter
  config.formatter = :documentation # :progress, :html, :textmate
  
  # Add settings configurations from yml
  #enviroment
  config.add_setting :environment_url
  config.environment_url = yml_config['environment_url']['ic'] 
  config.add_setting :fake_user  
end

def login username, password
  url = RSpec.configuration.environment_url
  p url
  visit url
  fill_in "Ingrese su usuario:", :with => username
  click_button "Ingresar"
end