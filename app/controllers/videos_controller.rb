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
    @test = params[:file]
    puts @test

    @picture = Picture.create(file: params[:file], tag: params[:tag])
    puts @picture

    @video = Video.create(link: params[:link], all_tags: params[:all_tags])
    # @video =  Video.create(params.require(:video).permit(:link, :all_tags))
    if @picture.save
      redirect_to '/'
    else
      render 'new'
    end
  end

end
