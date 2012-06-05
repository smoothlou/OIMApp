class UsersController < ApplicationController

def new
 @user = User.new
 
 respond_to do |format|
   format.html #new.html.erb
   format.json { render json: @user }
end
end

def edit
  @user = User.find(params[:id])
end

def create
  @user = User.new(params[:user])

  respond_to do |format|
    if @user.save
      format.html {redirect_to root_url, notice: 'Thanks for signing up!'}
      format.json { render json: @user, status: :created, location: @user }
    else
      format.html { render action: "new" }
      format.json { render json: @user.errors, status: :unprocessable_entity }
    end
  end
end

def show
  @user = User.find(params[:id])
  
  respond_to do |format|
    format.html # show.html.erb
    format.json { render json: @user }
  end
end

end