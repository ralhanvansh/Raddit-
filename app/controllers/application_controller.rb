class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_out_path_for(resource)
    new_user_session_path
  end
  def after_sign_in_path_for(resource)
    rolecheck
  end
  def after_sign_up_path_for(resource)
    rolecheck
  end



  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :role])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name])
  end

  def rolecheck
    if user_signed_in? == true
      if current_user.role == "Link"
          return links_path
      elsif current_user.role == "Url"
          return  url_index_path
      else
          return new_user_session_path
      end
    else
       return new_user_session_path
    end
  end

end
