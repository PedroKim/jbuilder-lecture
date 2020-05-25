class SessionsController < ApplicationController 
    def new
        render :new
    end

    def create
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user 
            # session[:session_token] = user.reset_session_token!
            login(user)
            redirect_to squeaks_url
        else
            flash.now[:errors] = ["wrong username/password combination"]
            render :new
        end
    end

    def destroy
        # current_user = User.find_by(session_token: session[:session_token])
        # current_user.reset_session_token!
        
        # session[:session_token] = nil
        
        logout

        redirect_to new_session_url
    end
end 