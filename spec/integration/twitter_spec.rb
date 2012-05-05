require 'spec_helper'

require File.dirname(__FILE__) + '/twitter'

describe Restfulie do

  TWITTER_ENTRY_POINT = "http://twitter.com/statuses/public_timeline.xml"

  it "should work with twitter" do
    stub_request(:get, "http://twitter.com/statuses/public_timeline.xml").to_return(:status => 200,
        :headers => {'Content-Type' => "application/xml; charset=utf-8"},
        :body => Responses::Twitter.public_timeline)
    twitter = Restfulie.at(TWITTER_ENTRY_POINT).get
    twitter.resource.statuses[0].user.screen_name.should == "fionnaps"
  end
end