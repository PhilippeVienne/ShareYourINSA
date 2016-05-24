module ApplicationHelper

  def comments_for(post)
    render 'application/comments', locals: {post:@post}
  end

end
