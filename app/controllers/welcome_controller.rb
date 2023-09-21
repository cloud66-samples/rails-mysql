class WelcomeController < ApplicationController
  def index
    sidekiq_class_from_queue(random_queue).perform_async
    delayed_job_class_from_queue(random_queue).new.deliver
    Resque.enqueue(resque_class_from_queue(random_queue))
    publish_empty_hash_to_sneakers(random_queue)
  end

  private

  def random_queue
    return ["high", "medium", "low"].sample
  end

  def sidekiq_class_from_queue(queue)
    case queue
    when "high"
      return SidekiqHighJob
    when "medium"
      return SidekiqMediumJob
    when "low"
      return SidekiqLowJob
    else
      raise ::ArgumentError.new("Unknown queue #{queue}")
    end
  end

  def resque_class_from_queue(queue)
    case queue
    when "high"
      return ResqueHighJob
    when "medium"
      return ResqueMediumJob
    when "low"
      return ResqueLowJob
    else
      raise ::ArgumentError.new("Unknown queue #{queue}")
    end
  end

  def delayed_job_class_from_queue(queue)
    case queue
    when "high"
      return DelayedJobHighJob
    when "medium"
      return DelayedJobMediumJob
    when "low"
      return DelayedJobLowJob
    else
      raise ::ArgumentError.new("Unknown queue #{queue}")
    end
  end

  def publish_empty_hash_to_sneakers(queue)
    conn = Bunny.new
    conn.start
    ch = conn.create_channel
    ch.default_exchange.publish({}.to_json, routing_key: queue)
    ch.close
    conn.close
  end
end
