module ApplicationHelper

  def comments_for(post)
    render partial: 'application/comments', locals: {post:post}
  end

end
