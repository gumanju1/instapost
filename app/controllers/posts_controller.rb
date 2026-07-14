class PostsController < ApplicationController
  before_action :authenticate_user, only: [ :new, :create ]
  before_action :is_owner?, only: [ :edit, :update, :destroy ]

  def index
  @pagy, @posts = pagy(
    Post.order(created_at: :desc).includes(:user, comments: :user),
    items: 5
  )

  respond_to do |format|
    format.html
    format.turbo_stream
  end
end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.create(post_params)

    if @post.valid?
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    if @post.update(post_params)
      redirect_to root_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy

    redirect_to root_path
  end

  private

  def is_owner?
    redirect_to root_path if Post.find(params[:id]).user != current_user
  end

  def post_params
    params.require(:post).permit(:photo, :description)
  end
end
