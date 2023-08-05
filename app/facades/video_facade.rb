class VideoFacade
  def get_videos(query)
    service = VideoService.new
    request = service.video_search(query)
    videos = request[:items].map do |data|
      Video.new(data)
    end
  end
end
