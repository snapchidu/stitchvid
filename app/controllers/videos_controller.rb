class VideosController < ApplicationController

  def index
    Video.unpublished.each do |video|
      begin
      video_status = HTTParty.get "https://www.googleapis.com/youtube/v3/videos?part=status&id=#{video.uid}&fields=items%2Fstatus&key=#{Rails.application.secrets.youtube_token}"
      video.update_columns(processed: true) if video_status["items"][0]["status"]["uploadStatus"] == "processed"
      rescue
      end
    end
    @tags = Tag.top(5)
  end

  def new
    @video = Video.new
  end

  def create
    @video =  Video.create(params.require(:video).permit(:link, :all_tags))
    if @video.save
      redirect_to '/'
    else
      render 'new'
    end
  end
end
