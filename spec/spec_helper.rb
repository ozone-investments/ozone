# frozen_string_literal: true

require 'rspec'
require 'simplecov'

RSpec.configure do |config|
  config.fail_fast = true

  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.disable_monkey_patching!

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.default_formatter = 'doc'
  config.order = :random
end
