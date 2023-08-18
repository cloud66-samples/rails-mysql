class ResqueJob
  @queue = :high

  def self.perform
    puts "Running inside resque!"
  end
end
