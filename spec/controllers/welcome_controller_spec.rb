require 'rails_helper'

RSpec.describe WelcomeController, :type => :controller do

  describe "GET index" do
    let (:drops) { [ Drop.new(url: "url-1", title: "some-title"), Drop.new(url: "url-2", foo: "bar"), ] }

    before :each do
      allow(Drop).to receive(:all).and_return(drops)
      get :index
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    it "renders the index view" do 
      expect(response).to render_template(:index)
    end
    it "sets a list of entries" do
      expect(assigns(:entries)).to eq [
        {url: "url-1", data: {title: "some-title"}},
        {url: "url-2", data: {foo: "bar"}},
      ]
    end
  end

end
