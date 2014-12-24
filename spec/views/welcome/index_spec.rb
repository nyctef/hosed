require 'rails_helper'

RSpec.describe "welcome/index" do
  it "can render some events" do 
    assign(:entries, [
      {url: "a-url", data: {foo: "bar"}}
    ])
    render
  end
end
