class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index, :show]
  before_action :set_post, only: %i[show]
  def index
    @posts = Post.all
  end

  def show
    @comment = Comment.new
  end

  private

  def set_post
    @post = Post.find(params[:id])
  end
end
