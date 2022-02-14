class UsersController < ApplicationController
  def index
    @book = Book.new
  end

  def show
    @book = Book.new
  end

  def edit
  end


  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end