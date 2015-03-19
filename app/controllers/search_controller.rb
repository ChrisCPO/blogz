class SearchController < ApplicationController
  def show
  end

  def tags
    @posts = Post.tagged_with(params[:tag])

    if @posts
      render :show
    else
      redirect_to :back
    end
  end
end
