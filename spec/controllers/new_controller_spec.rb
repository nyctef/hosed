require "rails_helper"
require_relative "../../lib/services/drops"
require_relative "../../lib/services/flavours"

RSpec.describe NewController do
  before do
    allow(Drops).to receive(:create)
    allow(Flavours).to receive(:start)
  end

  describe "POST #new" do 
    it "saves the url to the database" do
      expect(Drops).to receive(:create).with("a-url")
      post :new, { :url => "a-url" }
    end
    it "triggers actions on the url" do
      allow(Drops).to receive(:create).and_return(:new_filter)
      expect(Flavours).to receive(:start).with(:new_filter)

      post :new, { :url => "a-url" }
    end
    it "redirects back to the index" do
      post :new, { :url => "a-url" }

      expect(response).to redirect_to controller: :welcome, action: :index
    end
  end
end
