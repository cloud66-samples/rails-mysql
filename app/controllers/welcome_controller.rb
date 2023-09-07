class WelcomeController < ApplicationController
  def index
    SidekiqJob.perform_async
    DelayedJobHighJob.new.deliver
    Resque.enqueue(ResqueJob)
  end
end
