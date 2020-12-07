class Users::RegistrationsController < Devise::RegistrationsController
  def after_sign_up_path_for(resource)
    photos_path
  end
  
  def after_update_path_for(resource)
    photos_path
  end
end
