class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  #before_action :authenticate_user!,except: :index
  #before_action :authenticate_group!,except: :index


  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:[:nickname,:name,:family_name,:chair_person])
  end

  def after_sign_out_path_for(resource_or_scope)
    if resource_or_scope == :user
      new_user_session_path
    elsif resource_or_scope == :group
      new_group_session_path
    else
      root_path
    end
  end
  
end
