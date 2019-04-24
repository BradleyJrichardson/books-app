class BooksController < ApplicationController
  load_and_authorize_resource
  skip_authorize_resource :only => [:new, :create]
  def index
    @books = Book.includes(:author).all
  end

  def show
    @book = Book.find(params[:id])
    @review = Review.new
  end

  def new
    unless current_user.nil?
      @book = Book.new
    end
  end

  def create
    unless current_user.nil?
      @author = Author.all.find_by(name: params[:name])
      @book = Book.new(book_params)
      @book.author_id = @author.id
      @book.save

      redirect_to root_path
    end
  end
  
  def edit
    @book = Book.find(params[:id])
    # binding.pry
  end

  def update
    @book = Book.find(params[:id])
    @author = Author.all.find_by(name: params[:name])
    @book.update(book_params)
    @book.author_id =  @author.id
    @book.save
    redirect_to root_path
  end
  
  def delete
    @book = Book.find(params[:id])
    # binding.pry
    @book.destroy
    redirect_to root_path
  end
  private
    def book_params
      params.require(:book).permit(:title, :description)
    end

end
