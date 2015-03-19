class PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    current_user.posts << @post

    if @post.save
      redirect_to @post
    else
      render :new
    end
  end

  def show
    @post = find_post
  end

  def index
    @posts = current_user.posts
    @params = params
  end

  private

  def find_post
    @post ||= Post.find(params[:id])
  end

  def post_params
    params.require(:post).permit(:title, :tag_list, :content)
  end
end
