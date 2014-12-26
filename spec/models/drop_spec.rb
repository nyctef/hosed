require 'rails_helper'

class DropTest < ActiveSupport::TestCase
  test "requires a url" do
    bad_drop = Drop.new
    assert_not bad_drop.save
  end

  test "can have any attribute" do
    drop = Drop.new(url: 'http://example.com')
    drop.set(:html_title => 'example')
    assert drop.save
  end

  test "can have nested attributes" do
    drop = Drop.new(url: 'http://example.com')
    drop.set(html: {title: "example"})
    assert drop.save
    expect(drop[:html][:title]).to eq 'example'
  end
end
