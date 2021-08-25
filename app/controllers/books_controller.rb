class BooksController < ApplicationController
  def new
    @books = Book.new
  end

  def create
    @books = Book.new(books_params)
    @books.user_id = current_user.id
    if @books.save
      flash[:success]='You have created book successfully.'
     redirect_to book_path(@books.id)
    else
      flash[:danger] = "error"
     redirect_to books_path
    end
  end

  def index
    @user = current_user
    @books = Book.all
  end

  def show
    @book = Book.find(params[:id])
    @books = Book.new
    @user = @books.user
    @user = current_user
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(books_params)
      flash[:success]='You have updated book successfully.'
      redirect_to book_path(@book.id)
    else
      render :edit

    end
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to books_path
  end

  private

  def books_params
    params.require(:book).permit(:title, :body)
  end
end
