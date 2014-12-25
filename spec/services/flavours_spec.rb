describe Flavours do

  class ReturnsFooBar
    extend FlavourWorker
    @queue = :flavours
    def self.get_attrs(url)
      {foo: "bar"}
    end
  end

  before :each do
    Flavours.reset
    Resque.inline = true
    allow(Drops).to receive(:find).and_return(drop)
    allow(drop).to receive(:set)
  end

  let (:url) { "a-url" }
  let (:drop) { Drop.new(url: url) }

  it "accepts a drop to process" do
    Flavours.start(drop)
  end
  it "accepts a flavour to add" do
    Flavours.add ReturnsFooBar
  end
  it "runs flavours on processed urls" do
    expect(ReturnsFooBar).to receive(:get_attrs).with(url).and_return({foo: "bar"})

    Flavours.add ReturnsFooBar
    Flavours.start(drop)
  end
  it "adds returned key/value pairs to the model" do
    Flavours.add ReturnsFooBar
    
    expect(drop).to receive(:set).with(:foo => "bar")

    Flavours.start(drop)
  end
end
