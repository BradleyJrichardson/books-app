class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @book = Book.find(params[:book_id])
    @review = @book.reviews.create(review_params)

    @review.save
    redirect_to book_path(@book)
    # binding.pry
  end

  def delete
    @review = Review.find(params[:id])
    @book = @review.book
    @review.destroy
    redirect_to book_path(@book)
  end

  private
    def review_params
      params.require(:review).permit(:title, :review)
    end
end
