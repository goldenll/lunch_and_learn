class PhotoFacade
  def get_photos(query)
    service = PhotoService.new
    request = service.photo_search(query)
    photos = request[:results].map do |data|
      Photo.new(data)
    end
  end
end
