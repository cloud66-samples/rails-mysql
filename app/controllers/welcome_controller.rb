class WelcomeController < ApplicationController
  def index
    SidekiqJob.perform_async
    DelayedJobHighJob.new.deliver
    Resque.enqueue(ResqueHighJob)
  end
end
