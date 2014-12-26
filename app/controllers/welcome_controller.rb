require_relative "../../lib/services/drops"

class WelcomeController < ApplicationController
  def index
    @entries = Drops.all
  end

  def options_for_mopd
    render :nothing => true, :status => 200
  end
end
