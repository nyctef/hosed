require 'services/drops'
require 'services/flavours'

class NewController < ActionController::API
  def new
    url = params[:url]
    puts "test", url, params
    drop = Drops.create(url)
    Flavours.start(drop)
    redirect_to controller: :welcome, action: :index
  end 
end
