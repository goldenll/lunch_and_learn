class VideoSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :video_id
end
