class SearchController < ApplicationController
  def show
  end

  def tags
    @posts = Post.tagged_with(params[:tag])

    if @posts
      render :show
    end
  end
end
