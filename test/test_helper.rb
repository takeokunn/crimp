# frozen_string_literal: true

ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../config/environment', __dir__)
require 'rails/test_help'

module ActiveSupport
  class TestCase
    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

		# Add more helper methods to be used by all tests here...

		def log_in( user )
			if integration_test?
				#use warden helper
				login_as(user, :scope => :user)
			else #controller_test, model_test
				#use devise helper
				sign_in(user)
			end
		end

  end
end
