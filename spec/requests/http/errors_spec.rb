require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Restfulie::Client::HTTP do

  context "error conditions" do
    let(:restfulie) { Restfulie.at("http://localhost:4567/") }

    before :each do
      WebMock.reset!
    end
  
    it "receives error when 300..399  code is returned" do
      stub_request(:get, /.*\/test\/302/).to_return(:status => 200)
      restfulie.at("/test/302").get.should respond_with_status(200)
    end
    it "raise Error::Redirection error when 300..399  code is returned" do
      stub_request(:get, /.*\/test\/302/).to_return(:status => 399)
      lambda { restfulie.at("/test/302").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::Redirection
    end
  
    it "raise Error::BadRequest error when 400 code is returned" do
      stub_request(:get, /.*\/test\/400/).to_return(:status => 400)
      restfulie.at("/test/400").get.should respond_with_status(400)
    end
    it "receives error when 400 code is returned" do
      stub_request(:get, /.*\/test\/400/).to_return(:status => 400)
      lambda { restfulie.at("/test/400").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::BadRequest
    end
  
    it "raise Error::Unauthorized error when 401 code is returned" do
      stub_request(:get, /.*\/test\/401/).to_return(:status => 401)
      restfulie.at("/test/401").get.should respond_with_status(401)
    end
    it "receives error when 401 code is returned" do
      stub_request(:get, /.*\/test\/401/).to_return(:status => 401)
      lambda { restfulie.at("/test/401").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::Unauthorized
    end
  
    it "raise Error::Forbidden error when 403 code is returned" do
      stub_request(:get, /.*\/test\/403/).to_return(:status => 403)
      restfulie.at("/test/403").get.should respond_with_status(403)
    end
    
    it "receives error when 403 code is returned" do
      stub_request(:get, /.*\/test\/403/).to_return(:status => 403)
      lambda { restfulie.at("/test/403").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::Forbidden
    end
  
    it "raise Error::NotFound error when 404 code is returned" do
      stub_request(:get, /.*\/test\/404/).to_return(:status => 404)
      restfulie.at("/test/404").get.should respond_with_status(404)
    end
    it "receives error when 404 code is returned" do
      stub_request(:get, /.*\/test\/404/).to_return(:status => 404)
      lambda { restfulie.at("/test/404").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::NotFound
    end
  
    it "raise Error::MethodNotAllowed error when 405 code is returned" do
      stub_request(:get, /.*\/test\/405/).to_return(:status => 405)
      restfulie.at("/test/405").get.should respond_with_status(405)
    end
    it "receives error when 405 code is returned" do
      stub_request(:get, /.*\/test\/405/).to_return(:status => 405)
      lambda { restfulie.at("/test/405").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::MethodNotAllowed
    end
  
    it "raise Error::ProxyAuthenticationRequired error when 407 code is returned" do
      stub_request(:get, /.*\/test\/407/).to_return(:status => 407)
      restfulie.at("/test/407").get.should respond_with_status(407)
    end
    it "receives error when 407 code is returned" do
      stub_request(:get, /.*\/test\/407/).to_return(:status => 407)
      lambda { restfulie.at("/test/407").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::ProxyAuthenticationRequired
    end
  
    it "receives error when 409 code is returned" do
      stub_request(:get, /.*\/test\/409/).to_return(:status => 409)
      restfulie.at("/test/409").get.should respond_with_status(409)
    end
    
    it "raise Error::Conflict error when 409 code is returned" do
      stub_request(:get, /.*\/test\/409/).to_return(:status => 409)
     lambda { restfulie.at("/test/409").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::Conflict
    end
  
    it "raise Error::Gone error when 410 code is returned" do
      stub_request(:get, /.*\/test\/410/).to_return(:status => 410)
      restfulie.at("/test/410").get.should respond_with_status(410)
    end
    it "receives error when 410 code is returned" do
      stub_request(:get, /.*\/test\/410/).to_return(:status => 410)
     lambda { restfulie.at("/test/410").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::Gone
    end
  
    it "raise Error::PreconditionFailed error when 412 code is returned" do
      stub_request(:get, /.*\/test\/412/).to_return(:status => 412)
      restfulie.at("/test/412").get.should respond_with_status(412)
    end
    it "receives error when 412 code is returned" do
      stub_request(:get, /.*\/test\/412/).to_return(:status => 412)
      lambda { restfulie.at("/test/412").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::PreconditionFailed
    end
  
   it "receives error when 413 code is returned" do
     stub_request(:get, /.*\/test\/413/).to_return(:status => 413)
      restfulie.at("/test/413").get.should respond_with_status(413)
    end
    it "raise Error::ClientError error when 413 code is returned" do
      stub_request(:get, /.*\/test\/413/).to_return(:status => 413)
      lambda { restfulie.at("/test/413").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::ClientError
    end
  
   it "receives error when 501 code is returned" do
     stub_request(:get, /.*\/test\/501/).to_return(:status => 501)
      restfulie.at("/test/501").get.should respond_with_status(501)
    end
    it "raise Error::NotImplemented error when 501 code is returned" do
      stub_request(:get, /.*\/test\/501/).to_return(:status => 501)
      lambda { restfulie.at("/test/501").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::NotImplemented
    end
  
   it "receives error when 500 code is returned" do
     stub_request(:get, /.*\/test\/500/).to_return(:status => 500)
      restfulie.at("/test/500").get.should respond_with_status(500)
    end
    it "raise Error::ServerError error when 500 code is returned" do
      stub_request(:get, /.*\/test\/500/).to_return(:status => 500)
      lambda { restfulie.at("/test/500").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::ServerError
    end
  
   it "receives error when 503 code is returned" do
     stub_request(:get, /.*\/test\/503/).to_return(:status => 503)
     restfulie.at("/test/503").get.should respond_with_status(503)
    end
    
    it "raise Error::ServerNotAvailableError error when 503 code is returned" do
      stub_request(:get, /.*\/test\/503/).to_raise("Boom! 503")
      lambda { restfulie.at("/test/503").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::ServerNotAvailableError
    end
  
   it "receives error when 502..599 code is returned" do
     stub_request(:get, /.*\/test\/502/).to_return(:status => 502)
     restfulie.at("/test/502").get.should respond_with_status(502)
   end
   it "raise Error::ServerError error when 502..599 code is returned" do
     stub_request(:get, /.*\/test\/502/).to_return(:status => 502)
      lambda { restfulie.at("/test/502").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::ServerError
    end
  
   it "receives error when 600 or bigger code is returned" do
     stub_request(:get, /.*\/test\/600/).to_return(:status => 600)
     restfulie.at("/test/600").get.should respond_with_status(600)
   end
   it "raise Error::UnknownError error when 600 or bigger code is returned" do
     stub_request(:get, /.*\/test\/600/).to_return(:status => 600)
      lambda { restfulie.at("/test/600").get! }.should raise_exception ::Restfulie::Client::HTTP::Error::UnknownError
    end
  
  end
end

