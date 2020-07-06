class ApplicationController < ActionController::Base
	 # before_action :authenticate_user!
	 before_action :configure_permitted_parameters, if: :devise_controller?
     before_action :set_search

	def after_sign_in_path_for(resource)
    posts_path # ログイン後に遷移するpathを設定
    end

    def after_sign_out_path_for(resource)
    root_path # ログアウト後に遷移するpathを設定
    end

    protected
    def configure_permitted_parameters
	devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:introduction,:email])
    end

end
