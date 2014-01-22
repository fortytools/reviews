class ReviewsController < ApplicationController
  authorize_resource only: [:show, :new, :create, :edit, :update, :destroy]
  skip_authorization_check only: [:index]

  before_filter :require_login
  before_filter :new_review, only: [:new, :create]
  before_filter :load_review, only: [:show, :edit, :update]
  before_filter :load_current_review, only: [:index]
  before_filter :load_reviews_to_finish, only: [:index]

  def index
  end

  def show
  end

  def new
  end

  def create
    if @review.update_attributes(review_params)
      redirect_to root_path
    else
      render "new"
    end
  end

  def edit
  end

  def update
    if @review.update_attributes(review_params)
      redirect_to root_path
    else
      render "edit"
    end
  end

  private

  def review_params
    params.require(:review).permit(
      :user_id, :good, :bad, :goals, :company, :done,
      {reviews_attributes: [:user_id]})
  end

  def new_review
    @review = current_user.reviews.build
  end

  def load_review
    @review = Review.find(params[:id])
  end

  def load_current_review
    @current_review = current_user.current_review
  end

  def load_reviews_to_finish
    @reviews_to_finish = current_user.reviews_to_finish
  end
end
