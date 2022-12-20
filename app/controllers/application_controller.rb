class ApplicationController < ActionController::Base
    include SessionsHelper
    before_action :authenticate, except: [:new, :create, :autorization]
    
    private
    def authenticate
        unless session[:current_user_id]
            redirect_to root_path, notice: "Сначала нужно авторизоваться"
            p '+++++++++++++++++++++++++++++++++++++++++++'
        end
    end
end
