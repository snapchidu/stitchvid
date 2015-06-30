class VideosController < ApplicationController

  def index
    @videos = Video.all
    @tags = Tag.all
  end

  def new
    @video = Video.new
  end

  def create
    @video =  Video.create(params.require(:video).permit(:link, :title))
    if @video.save
      redirect_to '/'
    else
      render 'new'
    end
  end

  def stitch
    @playlist = Video.offset(1)
  end

end

def most_popular

end


# 2.2.0 :030 > Tag.where(:name == "test").inject([]){|accum,tag| accum+tag.videos.to_a}
