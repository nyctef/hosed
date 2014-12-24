require_relative "../../lib/services/drops"

class WelcomeController < ApplicationController
  def index
    @entries = Drops.all
  end
end
