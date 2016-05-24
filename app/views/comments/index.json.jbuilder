json.array!(@comments) do |comment|
  json.extract! comment,  :id, :post_id, :content, :created_at
  json.user comment.user.profile_user, :first_name, :last_name, :avatar
  json.url post_comment_url(comment.post, comment, format: :json)
end
