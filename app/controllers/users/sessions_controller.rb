class Users::SessionsController < Devise::SessionsController
  def after_sign_in_path_for(resource)
    photos_path
  end 
  
  def after_sign_out_path_for(resource)
    photos_path
  end 
end
