class VideosController < ApplicationController

  def index
    Video.unpublished.each do |video|
      begin
      video_status = HTTParty.get "https://www.googleapis.com/youtube/v3/videos?part=status&id=#{video.uid}&fields=items%2Fstatus&key=#{Rails.application.secrets.youtube_token}"
      video.update_columns(processed: true) if video_status["items"][0]["status"]["uploadStatus"] == "processed"
      rescue
      end
    end
    @tags = Tag.top(8)


    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "bD6YWvMq6sfwMpCqPchfEdYD4"
      config.consumer_secret     = "N7eTSVVIjrkECaOYEHASacL1qiDXE5S1COiiY0s8QfvgTCvGLP"
      config.access_token        = "22944799-wrm8KQA8QYbrvgKvjPpXH790kQSQKIRYH1U6wYdIg"
      config.access_token_secret = "esP01cdF1AO0x6STsJA8y6evnNZjp6JvvHUFW4s5Arwjp"
    end

    @trends = []
    @twitter_trends = @client.trends(23424975)
    @twitter_trends.each do |trend|
      @trends << trend.name
    end

    puts @trends
  end

  def new
    @video = Video.new
  end

  def create
    @video =  Video.create(params.require(:video).permit(:link, :tag))
    @video.processed = true
    if @video.save
      redirect_to '/'
    else
      render 'new'
    end
  end
end
