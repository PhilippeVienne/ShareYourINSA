class WallController < ApplicationController
  def index
    @posts = Post.all.order(:created_at).reverse_order.limit 20
  end

  def write_post
    @post = Post.create content: params[:content], user: current_user
    redirect_to action: :index
  end
end
