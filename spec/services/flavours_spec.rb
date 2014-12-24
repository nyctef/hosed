describe Flavours do
  before :each do
    Flavours.reset
  end

  let (:url) { "a-url" }
  let (:drop) { Drop.new(url: url) }

  it "accepts a drop to process" do
    Flavours.start(drop)
  end
  it "accepts a flavour to add" do
    Flavours.add { |url| {foo: "bar"} }
  end
  it "runs flavours on processed urls" do
    fl = double("flavour")
    expect(fl).to receive(:call).with(url).and_return({foo: "bar"})

    Flavours.add fl
    Flavours.start(drop)
  end
  it "adds returned key/value pairs to the model" do
    Flavours.add { |url| {baz: "qux"} }
    expect(drop).to receive(:set).with(:baz => "qux")

    Flavours.start(drop)
  end
end
