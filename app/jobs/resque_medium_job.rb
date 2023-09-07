class ResqueMediumJob
  @queue = :medium

  def self.perform
    puts "Running inside resque - medium queue!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
  end
end
