module Api
  module V1
    class LearningResourcesController < ApplicationController
      def index
        @video = VideoFacade.new.get_videos(params[:country]).first
        # require 'pry'; binding.pry
        render json: VideoSerializer.new(@video)

      end
    end
  end
end
