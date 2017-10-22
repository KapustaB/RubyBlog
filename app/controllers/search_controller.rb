class SearchController < ApplicationController
  def index
    @posts = params[:q].present? ? Post.search(params[:q]).records : []
  end

  def search_posts
    @posts = Post.search(params[:q]).records

    render action:"index"
  end
end
