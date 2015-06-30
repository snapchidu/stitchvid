class VideosController < ApplicationController

  def index
    @videos = Video.all
  end

  def new
    @video = Video.new
  end

  def create
    @video =  Video.create(params.require(:video).permit(:link))
    if @video.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  #why does this work? Called stitch on paths - doesn't work with stitch custom path
  def stitch
    @playlist = Video.offset(1)
  end

end
