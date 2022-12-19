class SessionsController < ApplicationController
    
    def autorization
        User.all.map do |elem|
             redirect_to lab_input_path [elem] if elem.login == params[:login] && elem.password == params[:password]
          end
          
    end

end
