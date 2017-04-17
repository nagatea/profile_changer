require "twitter"
require "./time.rb"
require "./weather_test.rb"

stream_client = Twitter::Streaming::Client.new do |config|
      config.consumer_key        = ENV['MY_CONSUMER_KEY']
      config.consumer_secret     = ENV['MY_CONSUMER_SECRET']
      config.access_token        = ENV['MY_ACCESS_TOKEN']
      config.access_token_secret = ENV['MY_ACCESS_TOKEN_SECRET']
end

client = Twitter::REST::Client.new do |config|
      config.consumer_key        = ENV['MY_CONSUMER_KEY']
      config.consumer_secret     = ENV['MY_CONSUMER_SECRET']
      config.access_token        = ENV['MY_ACCESS_TOKEN']
      config.access_token_secret = ENV['MY_ACCESS_TOKEN_SECRET']
end

if time_ver() == "asa"
      weather_name_today()
elsif time_ver() == "hiru"
      weather_name_today()
elsif time_ver() == "yoru"
      weather_name_tomorrow()
else
      
end
