class Review < ActiveRecord::Base
  belongs_to :user

  has_many :reviews, inverse_of: :review
  accepts_nested_attributes_for :reviews

  belongs_to :review, inverse_of: :reviews

  accepts_nested_attributes_for :reviews

  def waiting_for
    self.reviews.reject(&:done)
  end

  def waiting_for_names
    self.waiting_for.map(&:user).map(&:username).join(", ")
  end
end
