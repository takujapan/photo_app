class PhotosController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @feeds = Photo.where(user_id: [current_user.id, *current_user.following_ids]).order(created_at: :desc)
  end

  def show
    @photo   = Photo.find(params[:id])
    @comment = Comment.new
  end

  def new
    @photo = Photo.new
  end
  
  def create
    @photo = Photo.new(photo_params)
    @photo.user_id = current_user.id
    if @photo.save
      redirect_to photos_path(@photo), notice: '投稿に成功しました'
    else
      render :new
    end
  end

  def edit
    @photo = Photo.find(params[:id])
    if @photo.user != current_user
      redirect_to photos_path, alert: '不正なアクセスです。'
    end
  end
  
  def update
    @photo = Photo.find(params[:id])
    if @photo.update(photo_params)
      redirect_to photo_path(@photo), notice: '更新に成功しました'
    else
      render :edit
    end
  end
  
  def destroy
    photo = Photo.find(params[:id])
    photo.destroy
    redirect_to photos_path(photo)
  end
  
  private
    def photo_params
      params.require(:photo).permit(:image, :caption)
    end
end
