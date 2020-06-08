class Api::V1::ImageController < ApplicationController
  def show
    render json: ImageSerializer.new(Image.new(params[:location]))
  end
end
