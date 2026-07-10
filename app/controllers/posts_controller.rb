class PostsController < ApplicationController
  def index
  end

  def new
    @post = Post.new
  end
end

def create
  @post = current_user.posts.create(post_params)
  if @post.valid?
    redirect_to_root_path
  else
    render :new, status: :unprocessable_entity
  end
end

private

def post_params
  params.require(:post).permit(:photo, :description)
end
