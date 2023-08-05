class Video
  attr_reader :id,
              :title, 
              :video_id

  def initialize(data)
    # require 'pry'; binding.pry
    @id = nil
    @title = data[:snippet][:title]
    @video_id = data[:id][:videoId]
  end
end
