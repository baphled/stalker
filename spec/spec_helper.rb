# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV["RAILS_ENV"] ||= 'test'
require File.expand_path("../dummy/config/environment", __FILE__)
require 'rspec'
require 'mongoid'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}

RSpec.configure do |config|
  config.mock_with :rspec

  Mongoid.load!(File.join(File.dirname(__FILE__), '..', 'config', 'mongoid.yml'))

  config.before :each do
    Mongoid.master.collections.select {|c| c.name !~ /system/ }.each(&:drop)
    DB.recreate! rescue nil
  end
end

Mongoid.configure do |c| 
  c.logger = nil 
end 
