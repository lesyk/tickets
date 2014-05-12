class SearchWorker
  include Sidekiq::Worker

  def perform(message, number)
    time = Time.now.to_s
    puts 'Doing hard work ' + time
    sleep 10
    puts 'Finished ' + time
  end
end