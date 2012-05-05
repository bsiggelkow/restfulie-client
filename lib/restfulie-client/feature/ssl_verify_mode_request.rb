module Restfulie::Client::Feature
  class SslVerifyModeRequest

    def initialize(mode = OpenSSL::SSL::VERIFY_NONE)
      @mode = mode
    end

    def execute(flow, request, env)
      env[:ssl_verify_mode] = @mode
      flow.continue(request, env)
    end
  end
end