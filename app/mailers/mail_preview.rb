class MailPreview < MailView
  def new_review_assigned
    user = User.new(email: 'foo@example.com', username: 'foo')
    base_review = Review.new(user: user, id: 1)

    assigned_user = User.new(email: 'bar@example.com', username: 'bar')
    assigned_review = Review.new(user: assigned_user, review: base_review, id: 2)
    ReviewMailer.new_review_assigned(assigned_review)
  end
end
