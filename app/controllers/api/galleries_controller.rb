class Api::GalleriesController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def index
    respond_with :api, Gallery.all
  end

  def show
    respond_with :api, Gallery.find(params[:id])
  end

  def create
    respond_with :api, Gallery.create(gallery_params)
  end

  def edit
    respond_with :api, Gallery.find(params[:id])
  end

  def update
    respond_with :api, Gallery.update(params[:id], gallery_params)
  end

  def destroy
    respond_with :api, Gallery.destroy(params[:id])
  end

 private

  def gallery_params
    params.require(:gallery).permit(:title)
  end
end

# before_filter :find_galleries, only: [:index]
#   before_filter :find_gallery,   only: [:show]

#   def index
#     respond_with @galleries
#   end

#   def show
#     respond_with @gallery
#   end

#   def new
#   end

#   def create
#     @gallery = current_user.galleries.create(gallery_params)
#     redirect_to gallery_url(@gallery)
#   end

#   private

#   def gallery_params
#     params.require(:gallery).permit(:title)
#   end

#   def find_galleries
#     @galleries = if current_user
#       Gallery.where("photos_count > 0 OR user_id = #{current_user.id}")
#     else
#       Gallery.where("photos_count > 0")
#     end
#   end

#   def find_gallery
#     @gallery = Gallery.find(params[:id])
#   end
# end
