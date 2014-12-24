describe Flavours do
  before :each do
    Flavours.reset
  end
  it "accepts a drop to process" do
    Flavours.start(Drop.new(url: "a-url"))
  end
  it "accepts a flavour to add" do
    Flavours.add { |url| {foo: "bar"} }
  end
  it "runs flavours on processed urls" do
    fl = double("flavour")
    expect(fl).to receive(:call).with("a-url").and_return({foo: "bar"})
    drop = Drop.new(url: "a-url")

    Flavours.add fl
    Flavours.start(drop)
  end
  it "adds returned key/value pairs to the model" do
    Flavours.add { |url| {baz: "qux"} }
    drop = Drop.new(url: "a-url")
    expect(drop).to receive(:set).with(:baz => "qux")

    Flavours.start(drop)
  end
end
