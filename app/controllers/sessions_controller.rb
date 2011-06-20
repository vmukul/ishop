class SessionsController < ApplicationController

    def new
      respond_to do |format|
        format.html # new.html.erb
        format.iphone # new.iphone.erb
        end
    end

    def create
      user = User.authenticate(params[:email], params[:password])
      if user
        session[:user_id] = user.id
        @cu = 1
        redirect_to lists_path, :notice => " Logged in as "
      else
        flash.now.alert = "Invalid email or password"
        render "new"
      end
    end

    def destroy
      session[:user_id] = nil
      @cu = 2
      redirect_to root_path, :notice =>  "You have logged out of the "

    end

end
