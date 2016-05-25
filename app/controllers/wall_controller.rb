class WallController < ApplicationController
  def index
    @posts = Post.all.order(:created_at).reverse_order.limit 20
  end
end
