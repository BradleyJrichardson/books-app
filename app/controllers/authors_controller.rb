class AuthorsController < ApplicationController
  def index
  end

  def show
    @author = Author.find(params[:id])
  end

  def delete
    @author = Author.find(params[:id])
    @author.books.map(&:destroy)
    @author.destroy

    redirect_to root_path
  end
end
