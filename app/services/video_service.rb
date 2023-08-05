class VideoService 
  def conn
    Faraday.new(url: "https://youtube.googleapis.com") do |f|
      f.params["API_KEY"] = ENV["YOUTUBE_KEY"]
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end
  
  def video_search(query, ENV["YOUTUBE_KEY"])
    get_url("/youtube/v3/search?part=snippet&q=%40MrHistory1%2C%20#{query}&key=#{key}")
  end
end
