require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Restfulie::Client::HTTP do

  context 'HTTP Builder' do
    let(:restfulie) { Restfulie.at("http://localhost:4567/") }

    before :each do
      WebMock.reset!
    end
    
    context "On GET" do
      
      it "should respond to 200 code" do
        stub_request(:get, /.*\/test\/200/).to_return(:status => 200)
        restfulie.at('/test/200').get.should respond_with_status(200)
      end
      
      it "should accepts and respond to 200 code on xml" do
        stub_request(:get, /.*\/test\/200/).to_return(:status => 200)
        restfulie.at('/test/200').accepts('application/xml').get.should respond_with_status(200)
      end

      it "should respond to 200 code as xml" do
        stub_request(:get, /.*\/test\/200/).to_return(:status => 200)
        restfulie.at('/test/200').as('application/xml').get.should respond_with_status(200)
      end
      
      it "should accept language and respond 200" do
        stub_request(:get, /.*\/test\/200/).to_return(:status => 200)
        restfulie.at('/test/200').with('Accept-Language' => 'en').get.should respond_with_status(200)
      end
      
      it "should respond 200 code as xml and accept atom and language" do
        stub_request(:get, /.*\/test\/200/).to_return(:status => 200)
        restfulie.at('/test/200').as('application/xml').accepts('application/atom+xml').with('Accept-Language' => 'en').get.should respond_with_status(200)
      end
      
    end

    context "On DELETE" do
      
      it "should respond 200 code" do
        stub_request(:delete, /.*\/test/).to_return(:status => 200)
        restfulie.at("/test").delete.should respond_with_status(200)
      end
      
      it "should accepts xml and respond 200 code" do
        stub_request(:delete, /.*\/test/).to_return(:status => 200)
        restfulie.at('/test').accepts('application/xml').delete.should respond_with_status(200)
      end
      
      it "as xml should respond 200 code" do
        stub_request(:delete, /.*\/test/).to_return(:status => 200)
        restfulie.at('/test').as('application/xml').delete.should respond_with_status(200)
      end
      
      it "should respond 200 code with accept language en" do
        stub_request(:delete, /.*\/test/).to_return(:status => 200)
        restfulie.at('/test').with('Accept-Language' => 'en').delete.should respond_with_status(200)
      end
      
      it "should respond 200 code as xml accepts atom+xml with accept language en" do
        stub_request(:delete, /.*\/test/).to_return(:status => 200)
        restfulie.at('/test').as('application/xml').accepts('application/atom+xml').with('Accept-Language' => 'en').delete.should respond_with_status(200)
      end
      
    end
  
    context "On HEAD" do
      
      it "should respond 200 code" do
        stub_request(:head, /.*\/test/).to_return(:status => 200)
        restfulie.at("/test").head.should respond_with_status(200) 
      end
      
      it "should respond 200 code and accepts xml" do
        stub_request(:head, /.*\/test/).to_return(:status => 200)
        restfulie.at('/test').accepts('application/xml').head.should respond_with_status(200) 
      end
      
      it "should respond 200 code as xml" do
        stub_request(:head, /.*\/test/).to_return(:status => 200)
        restfulie.at('/test').as('application/xml').head.should respond_with_status(200)
      end
      
      it "should respond 200 code with accept language en" do
        stub_request(:head, /.*\/test/).to_return(:status => 200)
        restfulie.at('/test').with('Accept-Language' => 'en').head.should respond_with_status(200)
      end
      
      it "should respond 200 code as xml and accepts atom+xml with accepts language en" do
        stub_request(:head, /.*\/test/).to_return(:status => 200)
        restfulie.at('/test').as('application/xml').accepts('application/atom+xml').with('Accept-Language' => 'en').head.should respond_with_status(200)
      end
      
      it "should respond 200 code as xml and accepts atom+xml with accepts language en in a destructive method" do
        stub_request(:head, /.*\/test/).to_return(:status => 200)
        restfulie.at('/test').as('application/xml').accepts('application/atom+xml').with('Accept-Language' => 'en').head!.should respond_with_status(200)
      end
      
    end
    
  end
end


