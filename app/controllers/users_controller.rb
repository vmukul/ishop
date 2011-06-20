class UsersController < ApplicationController
  def new
    @user = User.new
 respond_to do |format|
        format.html # new.html.erb
        format.iphone # new.iphone.erb
        end
  end

  def create
     @user = User.new(params[:user])
    if @user.save
      redirect_to root_path, :notice => "Signed up"
    else
      render "new"
    end  
  end
end