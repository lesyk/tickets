# config/unicorn.rb

#allows the rail app to support multiple concurent requests, here only one process. 
worker_processes Integer(ENV["WEB_CONCURRENCY"] || 1)  

timeout 15

#pre laoding the application reduces the start up time of the worker processes.
preload_app true

#manage external connections for each proc
before_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn master intercepting TERM and sending myself QUIT instead'
    Process.kill 'QUIT', Process.pid
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.connection.disconnect!
end

after_fork do |server, worker|
  Signal.trap 'TERM' do
    puts 'Unicorn worker intercepting TERM and doing nothing. Wait for master to send QUIT'
  end

  defined?(ActiveRecord::Base) and
    ActiveRecord::Base.establish_connection
end
