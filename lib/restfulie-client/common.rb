require 'net/http'
require 'uri'
require 'medie'

module Restfulie
  
  # Code common to both client and server side is contained in the common module.
  module Common
    autoload :Error, 'restfulie-client/common/error'
    autoload :Logger, 'restfulie-client/common/logger'
  end

end

