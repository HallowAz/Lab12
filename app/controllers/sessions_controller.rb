require 'digest/sha1'
class SessionsController < ApplicationController
    
    def autorization
        reset_session
        User.all.map do |elem|
            if elem.login == params[:login] && elem.password == Digest::SHA1.hexdigest(params[:password])
                session[:current_user_id] = elem.id
                redirect_to lab_input_path
            end
        end
    end

    def create
        if user = User.authenticate(params[:username], params[:password])
        session[:current_user_id] = user.id
        redirect_to lab_input_path
        end
    end

    def destroy
        @_current_user = session[:current_user_id] = nil
        redirect_to root_url
    end
end
