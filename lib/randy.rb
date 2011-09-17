require "randy/version"
require "active_support/dependencies/autoload"

module Randy
  extend ActiveSupport::Autoload
  autoload :Distributions
  autoload :Util
  autoload :Prng  
end
