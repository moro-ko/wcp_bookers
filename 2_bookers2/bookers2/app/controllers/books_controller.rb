class BooksController < ApplicationController
  def index
    @new_book = Book.new
    @books = Book.all
  end


  def create
    @new_book = Book.new(book_params)
    @new_book.user_id = current_user.id
    if @new_book.save
      redirect_to book_path(@new_book.id), flash: {success: "You have created book successfully."}
    else
      @books = Book.all
      render :index
    end
  end


  def show
    @new_book = Book.new
    @book = Book.find(params[:id])
  end


  def edit
    @book = Book.find(params[:id])
  end


  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), flash: {success: "You have updated book successfully."}
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
  # ストロングパラメーター
  def book_params
    params.require(:book).permit(:title, :body)
  end

end
