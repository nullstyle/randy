require 'rubygems'
require 'bundler/setup'

require 'randy' 

RSpec.configure do |config|
  config.before(:each) do
    # this rng can be used in all specs to get consistent behavior
    @lcg = Randy::Rng::Lcg.new(1000)
  end
end