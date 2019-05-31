class ApplicationController < ActionController::Base
   # 以下を書くだけでよい
  prepend_view_path Rails.root.join("frontend")

  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?


  def after_sign_in_path_for(resource)
   # pages_show_path
    root_path
  end

  protected
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
      devise_parameter_sanitizer.permit(:account_update, keys: [:username])
    end

  private
    def sign_in_required
     # redirect_to new_user_session_url unless user_signed_in?
    end
end
