class WelcomeController < ApplicationController
  def index
    @year = params[:year]
    @month = params[:month]
    @my_time = Time.now
    @name = "Beengie"
    @stuff = ["Hello", "goodbye", "this", "that", "the other"]
  end
end
