require "twitter"
require "./time.rb"
require "./weather.rb"

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
  
def change_icon(day) #アイコンを変えるよ
      weather = Weather.new()
      username = weather.get_weather_name(day, "ながてち")
      weather_title = weather.get_weather(day)
      max_temp = weather.get_max_temperature(day)
      if /雨/ === weather_title
            icon_name = "rain.png"
      elsif max_temp != "not" && max_temp >= 33 
            icon_name = "hot.png"
      else
            icon_name = "nagatech.png"
      end
      icon = File.open(File.expand_path("../icon/" + icon_name, __FILE__), "r")
      client.update_profile(name: username)    
      client.update_profile_image(icon)
end

if time_ver() == "asa"
      change_icon("today")
elsif time_ver() == "hiru"
      change_icon("today")
elsif time_ver() == "yoru"
      change_icon("tomorrow")
else
      
end


