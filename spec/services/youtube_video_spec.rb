require_relative "../../lib/services/youtube_video"
require_relative "../../app/models/drop"

describe YoutubeVideo do
  let (:url) { "a-url" }
  let (:drop) { Drop.new(url: url) }

  before do
    allow(Drop).to receive(:find).with(:id).and_return(drop)
  end

  it "should accept drop id in perform method" do
    allow(YoutubeVideo).to receive(:get_attrs).and_return({})
    expect(YoutubeVideo.perform(:id)).not_to be_nil
  end

  it "should ignore non-youtube urls" do
    expect(YoutubeVideo.get_attrs("http://google.com")).to eq({})
  end

  it "should add video title to attrs", :vcr, record: :new_episodes do
    expect(YoutubeVideo.get_attrs("https://www.youtube.com/watch?v=9bZkp7q19f0")).to \
      include(youtube_video_title: "PSY - GANGNAM STYLE (강남스타일) M/V")
  end

  it "should add video author to attrs", :vcr, record: :new_episodes do 
    expect(YoutubeVideo.get_attrs("https://www.youtube.com/watch?v=9bZkp7q19f0")).to \
      include(youtube_video_author: "officialpsy")
  end

  it "should add video download link to attrs", :vcr, record: :new_episodes do
    expect(YoutubeVideo.get_attrs("https://www.youtube.com/watch?v=9bZkp7q19f0")).to \
      include(:youtube_video_dl)
  end
end
