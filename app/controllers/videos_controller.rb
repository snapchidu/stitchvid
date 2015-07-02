class VideosController < ApplicationController

  def index
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
