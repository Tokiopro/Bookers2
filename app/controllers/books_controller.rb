class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    @user = User.fing(current_user.id)
    @books = Book.all
    
    if @book.save
      redirect_to books_path(@book), notice: "You have created book successfully."
    else
      render :index
    end
  end

  def index
    @books = Book.all
    @book = Book.new
    @user = current_user
  end

  def show
    @book = Book.find(params[:id])
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
