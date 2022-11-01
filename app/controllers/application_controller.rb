class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    
    def after_sign_in_path_for(resource)
        projects_path
    end
    
    protected
    def authenticate_user!
        if user_signed_in?
            super
        else
            redirect_to new_user_session_path, :alert => 'You are not authorized!'
        end
    end

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) do |user_params|
            user_params.permit({ roles: [] }, :email, :password, :password_confirmation)
        end
    end
end
