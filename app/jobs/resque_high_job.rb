class ResqueHighJob
  @queue = :high

  def self.perform
    puts "Running inside resque - high queue!"
    puts "Sleeping for 30 seconds"
    sleep 30
    puts "Done sleeping"
  end
end
