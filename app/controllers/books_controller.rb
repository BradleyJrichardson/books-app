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
    @author_exists = Author.all.find_by(name: params[:author])
    @author = @author_exists.nil? ? Author.create(name: params[:book][:author]) : @author_exists
    # binding.pry

    @book = Book.new(book_params)
    @book.author_id = @author.id
    @book.save

    # New Book was created. Now send email alerting me. 
    @user = current_user
    BookMailer.with(user: @user).new_book_email.deliver_now
    redirect_to root_path
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
