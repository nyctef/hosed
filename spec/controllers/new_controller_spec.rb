require "rails_helper"
require_relative "../../lib/services/drops"
require_relative "../../lib/services/filters"

RSpec.describe NewController do
  before do
    allow(Drops).to receive(:create)
    allow(Filters).to receive(:start)
  end

  describe "POST #new" do 
    it "saves the url to the database" do
      expect(Drops).to receive(:create).with("a-url")
      post :new, { :url => "a-url" }
      expect(response).to be_success
    end
    it "triggers actions on the url" do
      allow(Drops).to receive(:create).and_return(:new_filter)
      expect(Filters).to receive(:start).with(:new_filter)

      post :new, { :url => "a-url" }
    end
  end
end
