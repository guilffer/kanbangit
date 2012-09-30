require 'fakefs/spec_helpers'

ENV['ITEMS_PATH'] = '/'

RSpec.configure do |config|
  config.include FakeFS::SpecHelpers
end