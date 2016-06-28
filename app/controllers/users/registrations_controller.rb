module Users
  class RegistrationsController < Devise::RegistrationsController
    before_action :configure_permitted_parameters

    protected

    # def after_sign_up_path_for(resource)
    #   edit_profile_path
    # end

    def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:merchant, :name, :email, :password, :password_confirmation, :photo, :photo_cache, :remember_me) }
    end
  end
end
