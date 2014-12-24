require 'services/drops'
require 'services/flavours'

class NewController < ActionController::API
  def new
    url = params[:url]
    drop = Drops.create(url)
    Flavours.start(drop)
  end 
end
