# This file is copied to spec/ when you run 'rails generate rspec:install'
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
# Prevent database truncation if the environment is production
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'

# Add additional requires below this line. Rails is not loaded until this point!
Dir[File.dirname(__FILE__) + "/support/**/*.rb"].each { |f| require f }
require 'pry'
require 'timecop'

Timecop.safe_mode = true

begin
  ActiveRecord::Migration.maintain_test_schema!
rescue ActiveRecord::PendingMigrationError => e
  puts e.to_s.strip
  exit 1
end
RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods # Adds FactoryBot methods
  config.use_transactional_fixtures = false
  config.infer_spec_type_from_file_location!

  config.include JsonHelper, :type => :serializer
  config.include JsonHelper, :type => :controller
  config.include JsonHelper, :type => :request

  config.extend EnvironmentVariableHelper

  # Filter lines from Rails gems in backtraces.
  config.filter_rails_from_backtrace!
  # arbitrary gems may also be filtered via:
  # config.filter_gems_from_backtrace("gem name")
end

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end
