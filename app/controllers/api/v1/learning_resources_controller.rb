class Api::V1::LearningResourcesController < ApplicationController
  def index
    if params[:country] == "''" 
      render json: { data: {} }
    else
      render json: LearningResourceSerializer.new(LearningResourceFacade.new.get_resources(params[:country]))
    end
  end
end
