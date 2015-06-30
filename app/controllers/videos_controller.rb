class VideosController < ApplicationController

  def index
    @videos = Video.all
    #The playlist creation is completely arbitrary, just generates something we can use
    @playlist = Video.offset(1)
  end

end
