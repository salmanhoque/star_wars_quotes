require File.join(File.expand_path('../../config', __FILE__), 'db')
Dir["#{File.expand_path('../../models', __FILE__)}/*.rb"].each { |file| require file }

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.after(:each) do
    ActiveRecord::Base.connection.close
  end
end
