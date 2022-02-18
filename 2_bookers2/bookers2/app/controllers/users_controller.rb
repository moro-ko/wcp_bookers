class UsersController < ApplicationController
  def index
    @new_book = Book.new
    @users = User.all
  end

  def show
    @new_book = Book.new
    @user = User.find(params[:id])
    # アソシエーションを持っているモデル同士の記述方法(15章)
    # 特定のユーザー(@user)に関連づけられた投稿全て(books)を取得し、@booksに渡す という処理
    @books = @user.books
  end

  def edit
    @user = User.find(params[:id])
    if @user == current_user
      render :edit
    else
      redirect_to user_path(current_user.id)
    end
  end


  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path(@user.id), flash: {success: "You have updated user successfully."}
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :introduction, :image)
  end
end