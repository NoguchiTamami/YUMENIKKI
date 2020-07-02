class UsersController < ApplicationController

 def new
   @posts = Post.all
   @post = Post.new
 end

 def index
   @users = User.all
   @posts = Post.all
   @post = Post.new
   @user = current_user
 end

 def show
  @user = User.find(params[:id])
  @post = Post.new
  @posts = @user.posts
 end

 def edit
  @user = User.find(params[:id])
 end

  def update
  @user = User.find(params[:id])
  if @user.update(user_params)
   redirect_to user_path(@user.id), notice: 'User was successfully created.'
 else
  render action: :edit
end
 end

def ensure_correct_user

  if current_user.id !=  params[:id].to_i

    redirect_to user_path(current_user.id)

  end
end

private

def user_params
  params.require(:user).permit()
end
end
