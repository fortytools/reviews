class User < ActiveRecord::Base
  authenticates_with_sorcery!

  has_many :reviews
  validate :username, :email, presence: true

  def current_review
    reviews.where(done: false).where('review_id IS NULL').order(created_at: :desc).first
  end

  def reviews_to_finish
    reviews.where(done: false).where('review_id IS NOT NULL').order(created_at: :asc)
  end

  def display_name
    "#{self.username} (#{self.email})"
  end

  scope :without_user, ->(user) do
    where('id != ?', user.id)
  end

end
