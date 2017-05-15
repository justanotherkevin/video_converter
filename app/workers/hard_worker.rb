

class HardWorker
  include Sidekiq::Worker

  # def perform(*args)
  #   # Do something
  # end
  def perform(name, count)
  # do something
    puts name
    puts '###################'
    puts count
  end

end
