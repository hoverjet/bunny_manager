require 'bundler/setup'
require 'bunny_manager'
require 'bunny-mock'

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  # Disable RSpec exposing methods globally on `Module` and `main`
  config.disable_monkey_patching!

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end

  config.before(:each) do
    allow(BunnyManager::Conn).to receive(:client_class).and_return(BunnyMock)
  end
  config.after(:each) do
    BunnyManager.disconnect
  end
end
