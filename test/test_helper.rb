ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    setup do
      DatabaseCleaner.start
    end
  
    teardown do
      DatabaseCleaner.clean
    end
  end
end
