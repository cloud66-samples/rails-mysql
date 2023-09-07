class WelcomeController < ApplicationController
  def index
    SidekiqHighJob.perform_async
    DelayedJobHighJob.new.deliver
    Resque.enqueue(ResqueHighJob)
  end
end
