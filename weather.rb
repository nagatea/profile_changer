require "twitter"
require 'open-uri'
require 'nokogiri'
require "./time.rb"

def weather_change_today() #今日の天気からプロフィールを変えるよ
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

  url = 'http://www.jma.go.jp/jp/yoho/319.html'

  charset = nil
  html = open(url) do |f|
    charset = f.charset
    f.read
  end
  doc = Nokogiri::HTML.parse(html, nil, charset)

  tds = doc.xpath("//th[@class='weather']") # 天気
  wea = tds[0].to_s
  weather = wea.match(/title="(.+)" alt/)
  weather_title = weather[1]
  if /雨/ === weather_title
    change_icon("ametech")
  else
    change_icon("nagatech")
  end
  weather_title.gsub!(/晴れ/,"☀")
  weather_title.gsub!(/曇り/,"☁")
  weather_title.gsub!(/雨/,"☔")
  weather_title.gsub!(/雪/,"⛄")
  weather_title.gsub!(/止む/,"🌂")
  weather_title.gsub!(/後/,"/")
  weather_title.gsub!(/時々/,"|")
  weather_title.gsub!(/\/\|/,"/時々")

  username = "ながてち (" + weather_title + ")"
  client.update_profile(:name => username)
end

def weather_change_tomorrow() #明日の天気からプロフィールを変えるよ
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

  url = 'http://www.jma.go.jp/jp/yoho/319.html'

  charset = nil
  html = open(url) do |f|
    charset = f.charset
    f.read
  end
  doc = Nokogiri::HTML.parse(html, nil, charset)

  tds = doc.xpath("//tr[3]/th[@class='weather']") # 天気
  wea = tds[0].to_s
  weather = wea.match(/title="(.+)" alt/)
  weather_title = weather[1]
  if /雨/ === weather_title
    change_icon("ametech")
  else
    change_icon("nagatech")
  end
  weather_title.gsub!(/晴れ/,"☀")
  weather_title.gsub!(/曇り/,"☁")
  weather_title.gsub!(/雨/,"☔")
  weather_title.gsub!(/雪/,"⛄")
  weather_title.gsub!(/止む/,"🌂")
  weather_title.gsub!(/後/,"/")
  weather_title.gsub!(/時々/,"|")
  weather_title.gsub!(/\/\|/,"/時々")

  username = "ながてち (明日:" + weather_title + ")"
  client.update_profile(:name => username)
end

def change_icon(name) #アイコンを変えるよ
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

  icon_name = name + ".png"
  icon = File.open(File.expand_path("../icon/" + icon_name, __FILE__), "r") 
  
  client.update_profile_image(icon)

end