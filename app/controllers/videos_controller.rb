class VideosController < ApplicationController
  respond_to :html, :json
  def index
    @tags = Tag.all

    @videos = Video.all
    respond_with(@videos.to_json)
    # respond_to do |format|
    #   @videos = Video.all
    #   format.json { render :json => @videos.to_json}
    # end
  end

  def new
    @video = Video.new
  end

  def create
    @test = params[:link]
    puts @test

    @video = Video.create(link: params[:link], all_tags: params[:all_tags])
    # @video =  Video.create(params.require(:video).permit(:link, :all_tags))
    if @video.save
      redirect_to '/'
    else
      render 'new'
    end
  end
end
