require_relative "../../lib/services/html_title"
require_relative "../../app/models/drop"

describe HtmlTitle do
  let (:url) { "a-url" }
  let (:drop) { Drop.new(url: url) }

  before do
    allow(Drop).to receive(:find).with(:id).and_return(drop)
  end

  it "should accept drop id in perform method" do
    allow(HtmlTitle).to receive(:get_attrs).and_return({})
    expect(HtmlTitle.perform(:id)).not_to be_nil
  end

  it "should fetch the title from a webpage", :vcr, record: :new_episodes do
    expect(HtmlTitle.get_attrs("http://google.co.uk")).to eq ({ html: {title: "Google" }})
  end
end
