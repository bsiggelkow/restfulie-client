require File.join(File.dirname(__FILE__),'..','spec_helper')

share_examples_for "restful client" do
  before(:each) do
    WebMock.reset!
    stub_request(:get, /.*\/songs/).to_return(:body    => File.new(File.join(File.dirname(__FILE__),'atoms/songs')),
                                              :status  => 200,
                                              :headers => {'Content-Type' => 'application/atom+xml'})
    stub_request(:get, /.*\/songs_top_ten/).to_return(:body    => File.new(File.join(File.dirname(__FILE__),'atoms/songs_top_ten')),
                                                      :status  => 200,
                                                      :headers => {'Content-Type' => 'application/atom+xml'})
    stub_request(:get, /.*\/related_songs/).to_return(:body    => File.new(File.join(File.dirname(__FILE__),'atoms/related_songs')),
                                                      :status  => 200,
                                                      :headers => {'Content-Type' => 'application/atom+xml'})
    stub_request(:get, /.*\/song_4/).to_return(:body    => File.new(File.join(File.dirname(__FILE__),'atoms/song_4')),
                                               :status  => 200,
                                               :headers => {'Content-Type' => 'application/atom+xml'})
    response = restfulie.accepts("application/atom+xml").get!
    response.code.should == 200
    @songs = response.resource.feed
  end

  it 'should load songs' do
    @songs.title.should == 'Songs feed'
    @songs.id.should == 'http://localhost:4567/songs'
    @songs.updated.should == '2010-12-13T18:30:02Z'
    @songs.entry.size.should == 4
    a_song = @songs.entry.first
    a_song.title.should == 'Song 1'
    a_song.id.should == 'http://localhost:4567/songs_1'
  end


  it 'should load top ten songs' do
    top_ten_songs = @songs.links.top_ten.follow.get!.resource.feed
    top_ten_songs.title.should == 'Top Ten Songs feed'
    top_ten_songs.id.should == 'http://localhost:4567/songs_top_ten'
    top_ten_songs.updated.should == '2010-12-13T18:30:02Z'
    a_song = top_ten_songs.entry.first
    a_song.title.should == 'Song 3'
    a_song.id.should == 'http://localhost:4567/song_3'
  end

  it 'should load chained relationship' do
    top_ten_songs = @songs.links.top_ten.follow.get!.resource.feed
    a_song = top_ten_songs.entry.first
    related_songs = a_song.links.related_songs.follow.get!.resource.feed
    first_related_song = related_songs.entry.first
    similar_song = first_related_song.links.similar_song
    similar_song.follow.get!.resource.feed.title.should == 'Song 4 feed'
  end
end

describe Restfulie::Client::Base do
  let(:restfulie) do
    module Restfulie::Client::Test
      class Song
        include ::Restfulie::Client::Base
        uses_restfulie { |config| config.entry_point = 'http://localhost:4567/songs' }
      end
    end
    Restfulie::Client::Test::Song
  end

  it_behaves_like "restful client"
end

describe Restfulie do

  context 'Delegate to entrypoint' do
    let(:restfulie) do
      Restfulie.at('http://localhost:4567/songs').accepts('application/atom+xml')
    end

    it_behaves_like "restful client"
  end

end
