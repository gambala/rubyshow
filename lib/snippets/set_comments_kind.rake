# Set types to existing comments
Comment.all.each do |comment|
  if comment.graduate?
    comment.update(kind: Comment.kinds[:opinion])
  else
    comment.update(kind: Comment.kinds[:comment])
  end
end
