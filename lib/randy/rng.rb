module Randy::Rng
  extend ActiveSupport::Autoload
  
  autoload :Base
  autoload :Lcg
  autoload :Dummy
  autoload :System
end