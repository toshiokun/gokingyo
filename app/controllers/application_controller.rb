class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include Jpmobile::ViewSelector
  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_search
  before_filter :set_view_path
  protected
    def configure_permitted_parameters
      	devise_parameter_sanitizer.for(:sign_up) do |u|
      		u.permit(:name, :profile,
        		:email, :password, :password_confirmation)
    	end
    	devise_parameter_sanitizer.for(:account_update) do |u|
     	 	u.permit(:name, :profile,
        		:email, :password, :password_confirmation, :current_password)
    	end
    end

  private
    def set_view_path
      path =  request.smart_phone? ? 'smartphone' : 'pc'
      prepend_view_path(Rails.root + 'app/views' + path)
    end

  def set_search
    @search = Event.search(params[:q])
  end

  def after_sign_in_path_for(resource)
    root_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  def current_user?(user)
    user == current_user
  end

end
