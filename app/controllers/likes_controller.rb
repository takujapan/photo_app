class LikesController < ApplicationController
  def create
    @like = current_user.likes.create(photo_id: params[:photo_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    @photo = Photo.find(params[:photo_id])
    @like  = current_user.likes.find_by(photo_id: @photo.id)
    @like.destroy
    redirect_back(fallback_location: root_path)
  end
end
