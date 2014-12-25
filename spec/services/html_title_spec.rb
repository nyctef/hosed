require_relative "../../lib/services/html_title"

describe HtmlTitle do
  let (:url) { "a-url" }
  let (:drop) { Drop.new(url: url) }

  before do
    allow(Drop).to receive(:find).with(:id).and_return(drop)
  end

  it "should accept drop id in perform method" do
    expect(HtmlTitle.perform(:id)).not_to be_nil
  end

  it "should fetch the title from a webpage"
end
