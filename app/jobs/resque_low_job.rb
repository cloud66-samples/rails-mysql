class ResqueLowJob
  @queue = :low

  def self.perform
    puts "Running inside resque - low queue!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
  end
end
