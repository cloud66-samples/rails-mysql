class WelcomeController < ApplicationController
  def index
    SidekiqJob.perform_async
    DelayedJobJob.new.deliver
    Resque.enqueue(ResqueJob)
  end
end
