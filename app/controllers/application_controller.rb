class ApplicationController < ActionController::Base
    #HOOKS: Callbacks
    before_action :set_locale
    before_action :authenticate_user!

    #Paper clip
    #protect_from_forgery with: :exception
   
    before_action :configure_permitted_parameters, if: :devise_controller?

    #Capturamos ese error o excepcion y hacemos algo en ese caso redirigir al root
    rescue_from CanCan::AccessDenied do |exception|
        #redirect_to root_path
    end

    def set_locale
        I18n.locale = 'es'
    end

    protected

    def configure_permitted_parameters
        devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache) }
        devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:username, :password, :password_confirmation, :current_password, :avatar) }
    end
    
end
