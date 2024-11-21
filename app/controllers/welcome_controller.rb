class WelcomeController < ApplicationController
  def index
    ENV.each_pair do |key, value|
      @environment_variables = @environment_variables + "#{key}: #{value} </br>"
    end
    @environment_variables = @environment_variables + "</br>"
  end
end
