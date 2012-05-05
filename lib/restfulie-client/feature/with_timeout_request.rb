module Restfulie::Client::Feature

  class WithTimeoutRequest

    def initialize(timeout)
      @timeout = timeout.first if timeout
    end

    def execute(flow, request, env)
      env[:http_read_timeout] = @timeout if @timeout
      flow.continue(request, env)
    end
  end
end