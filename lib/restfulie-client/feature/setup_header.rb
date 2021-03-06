module Restfulie::Client::Feature

  class SetupHeader
    
    def execute(flow, request, env)
      headers = request.default_headers.dup.merge(request.headers)
      host = request.host
      if host.user || host.password
        headers["Authorization"] = "Basic " + ["#{host.user}:#{host.password}"].pack("m").delete("\r\n")
      end
      headers['cookie'] = request.cookies if request.cookies
      
      # gs: this should not be overriden, do it in some other way
      request.headers = headers
      
      flow.continue(request, env)
    end
    
  end
  
end