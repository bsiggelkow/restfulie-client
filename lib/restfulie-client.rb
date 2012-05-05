$:.unshift(File.dirname(__FILE__)) unless $:.include?(File.dirname(__FILE__))

require 'restfulie-client/version'
require 'restfulie-client/common'

module Restfulie
  module Client
    autoload :MasterDelegator, 'restfulie-client/master_delegator'
    autoload :HTTP, 'restfulie-client/http'
    autoload :Configuration, 'restfulie-client/configuration'
    autoload :EntryPoint, 'restfulie-client/entry_point'
    autoload :Base, 'restfulie-client/base'
    autoload :Mikyung, 'restfulie-client/mikyung'
    autoload :Cache, 'restfulie-client/cache'
    autoload :Feature, 'restfulie-client/feature'
    autoload :Dsl, 'restfulie-client/dsl'
    autoload :StackNavigator, 'restfulie-client/stack_navigator'

    mattr_accessor :cache_provider, :cache_store

    Restfulie::Client.cache_store = ActiveSupport::Cache::MemoryStore.new
    Restfulie::Client.cache_provider = Restfulie::Client::Cache::Fake.new

  end
end

require 'restfulie-client/ext'

# Shortcut to RestfulieDsl
module Restfulie

  # creates a new entry point for executing requests
  def self.at(uri)
    Restfulie.use.at(uri)
  end

  def self.use(&block)
    if block_given?
      Restfulie::Client::Dsl.new.instance_eval(&block)
    else
      Restfulie::Client::Dsl.new
    end
  end

end
