class GalleriesController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def index
    @galleries = if current_user
      Gallery.where("photos_count > 0 OR user_id = #{current_user.id}")
    else
      Gallery.where("photos_count > 0")
    end
  end

  def new

  end

  def create
    @gallery = current_user.galleries.create(gallery_params)
    redirect_to gallery_url(@gallery)
  end

  def show
    @gallery = Gallery.find(params[:id])
  end

  private

  def gallery_params
    params.require(:gallery).permit(:title)
  end
end
