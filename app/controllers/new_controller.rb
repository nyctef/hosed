require 'services/drops'

class NewController < ActionController::API
  def new
    url = params[:url]
    drop = Drops.create(url)
  end 
end
