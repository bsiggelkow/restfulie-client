require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Restfulie::Client::HTTP do
  let(:host){"http://localhost:4567"}

  context 'RequestHistory' do
    it "should remember last requests" do
      stub_request(:get, /.*\/test/).to_return(:status => 200)
      stub_request(:head, /.*\/test/).to_return(:status => 200)
      stub_request(:delete, /.*\/test/).to_return(:status => 200)
      stub_request(:get, /.*\/test\/500/).to_return(:status => 500)

      req_history = Restfulie.at(host).history
      r1 = req_history.at('/test').accepts('application/atom+xml').with('Accept-Language' => 'en').get
      r1.should respond_with_status(200)
      r2 = r1.at('/test').accepts('text/html').with('Accept-Language' => 'pt-BR').head
      r2.should respond_with_status(200)
      r3 = r2.at('/test').as('application/xml').with('Accept-Language' => 'en').delete
      r3.should respond_with_status(200)
      r4 = r3.at('/test/500').accepts('application/xml').with('Accept-Language' => 'en').get
      r4.should respond_with_status(500)

      req = req_history.history(-1)
      req.verb.should == :get
      req.path.should == '/test/500'
      req.host.to_s.should == host + "/test/500"
      req.headers['Accept'].should == 'application/xml'
      req.headers['Accept-Language'].should == 'en'

      req = req.history(-2)
      req.verb.should == :delete
      req.path.should == '/test'
      req.host.to_s.should == host + "/test"
      req.headers['Accept'].should == 'application/xml'
      req.headers['Accept-Language'].should == 'en'
      req.headers['Content-Type'].should == 'application/xml'

      #req = req.history(-3)
      #req.verb.should == :head
      #req.path.should == '/test'
      #req.host.to_s.should == host + "/test"
      #req.headers['Accept'].should == 'text/html'
      #req.headers['Accept-Language'].should == 'pt-BR'
      #
      #req = req.history(-4)
      #req.path.should == '/test'
      #req.host.to_s.should == host + "/test"
      #req.headers['Accept'].should == 'application/atom+xml'
      #req.headers['Accept-Language'].should == 'en'

      lambda { req.history(10).request }.should raise_error RuntimeError
    end 
  
  end
    
end

