class VideosController < ApplicationController

  def index
    @videos = Video.all
    @uids = []

    @videos.each do |video|
      @uids.push(video.uid)
    end

  end

end
