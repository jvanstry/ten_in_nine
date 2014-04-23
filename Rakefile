# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

TenInNine::Application.load_tasks

desc "Pings PING_URL to keep a dyno alive"
task :dyno_ping do
  require "net/http"

  if ENV['PING_URL']
    ping_url = ENV['PING_URL'].split(",")
    ping_url.each do |url|
      uri = URI(url)
      Net::HTTP.get_response(uri)
    end
  end
end