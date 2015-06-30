class VideoObserver < ActiveRecord::Observer

  def before_save(resource)
    video = Yt::Video.new url: resource.link
    resource.uid = video.id
    # resource.title = video.title
    # resource.published_at = video.published_at
  rescue Yt::Errors::NoItems
    resource.title = ''
  end

end