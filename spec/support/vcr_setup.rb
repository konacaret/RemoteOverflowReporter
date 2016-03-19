require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/support/cassettes'
  c.default_cassette_options = { :record => :new_episodes }
  c.hook_into :webmock
end
