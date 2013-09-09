class GalleriesController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  before_filter :find_galleries, only: [:index]
  before_filter :find_gallery,   only: [:show]

  respond_to :json, :html

  def index
    respond_with @galleries
  end

  def show
    respond_with @gallery
  end

  def new
  end

  def create
    @gallery = current_user.galleries.create(gallery_params)
    redirect_to gallery_url(@gallery)
  end

  private

  def gallery_params
    params.require(:gallery).permit(:title)
  end

  def find_galleries
    @galleries = if current_user
      Gallery.where("photos_count > 0 OR user_id = #{current_user.id}")
    else
      Gallery.where("photos_count > 0")
    end
  end

  def find_gallery
    @gallery = Gallery.find(params[:id])
  end
end
