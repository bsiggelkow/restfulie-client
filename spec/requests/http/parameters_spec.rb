require File.join(File.dirname(__FILE__),'..','..','spec_helper')

describe Restfulie do
  
  it "should accept parameters in get requests" do
    stub_request(:get, /.*\/request_with_querystring/).to_return(:status => 200, :body => {foo: 'bar', bar: 'foo'}.to_json)
    result = Restfulie.at('http://localhost:4567/request_with_querystring').get(:foo => "bar", :bar => "foo")
    params  = JSON.parse(result.body)
    params["foo"].should == "bar"
    params["bar"].should == "foo"
  end
  
end