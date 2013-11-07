class WelcomeController < ApplicationController
  def index
    @my_time = Time.now
    @name = "Beengie"
    @stuff = ["Hello", "goodbye", "this", "that", "the other"]
  end
end
