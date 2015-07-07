class VideoUploadsController < ApplicationController
  def new
    @video_upload = VideoUpload.new
    if current_user
      render :new
    else
      redirect_to '/auth/google_oauth2'
    end
  end

  def create
    @video_upload = VideoUpload.new(title: params[:video_upload][:title],
                                  description: params[:video_upload][:description],
                                  file: params[:video_upload][:file].try(:tempfile).try(:to_path))

    @tag = params[:video_upload][:tag]
    puts @tag

    if @video_upload.save
      uploaded_video = @video_upload.upload!(current_user)

      if uploaded_video.failed?
        flash[:error] = 'There was an error while uploading your video...'
      else
        Video.create({link: "https://www.youtube.com/watch?v=#{uploaded_video.id}", tag: @tag})
        flash[:success] = 'Your video has been uploaded! It is being processed and will appear shortly.'
      end

      redirect_to root_url
    else
      render :new
    end
  end

end
