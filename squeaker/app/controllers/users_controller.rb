class UsersController < ApplicationController
    def new
        render :new
    end

    def create
        @user = User.new(user_params)
        @user.location = Location.first
        @user.birth_year = 2020

        if @user.save
            # session[:session_token] = @user.reset_session_token!
            login(@user)

            redirect_to squeaks_url 
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def user_params
        params.require(:user).permit(:username, :password)
    end
end