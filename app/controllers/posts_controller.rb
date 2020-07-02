class PostsController < ApplicationController


def new
    @post = Post.new
  end

  def create
  	@post = Post.new(post_params)
    @post.user = current_user
    if @post.save
      redirect_to post_path(@post.id), notice: 'Post was successfully created.'
    else
      @posts = Post.all
      @user = current_user
      render action: :index
    end
  end

  def index
   @posts = Post.all
   @post = Post.new
   @user = current_user
 end

 def show
   @post_new = Post.new
   @post = Post.find(params[:id])
   @user = @post.user
 end

 def edit
  @post = Post.find(params[:id])
  unless current_user.id == @post.user.id
    redirect_to posts_path
  end
  @user = current_user
end

def update
 @post = Post.find(params[:id])
 if @post.update(post_params)
  redirect_to post_path(@post), notice: 'Post was successfully created.'
else
 render action: :edit
end
end


def destroy
  @post = Post.find(params[:id])
  @post.destroy 
  redirect_to posts_path 
end

private
def post_params
  params.require(:post).permit(:title, :body)
end

end
