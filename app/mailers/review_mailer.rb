class ReviewMailer < ActionMailer::Base
  default from: "from@example.com"

  def new_review_assigned(review)
    @review = review
    recipient = review.user.email
    creator = @review.review.user.username
    mail(to: recipient, subject: I18n.t('review_mailer.new_review_assigned.subject', user: creator))
  end
end
