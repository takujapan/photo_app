class FollowsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    current_user.active_relationships.create(target_user_id: params[:user_id])
    redirect_back(fallback_location: root_path)
  end
  
  def destroy
    current_user.active_relationships.find_by(target_user_id: params[:user_id]).destroy
    redirect_back(fallback_location: root_path)
  end
end
