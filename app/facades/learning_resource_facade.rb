class LearningResourceFacade
  def get_resources(country)
    video = VideoFacade.new.get_videos(country).first
    images = PhotoFacade.new.get_photos(country)

    LearningResource.new(country, video, images)
  end
end
