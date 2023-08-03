class WelcomeController < ApplicationController
  def index
    sleep rand(0.0..10.0)
  end
end
