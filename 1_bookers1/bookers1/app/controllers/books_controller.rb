class BooksController < ApplicationController
  # 一覧画面
  def index
    @books = Book.all
    @book = Book.new
  end

  # データの追加・保存
  def create
    # ローカル変数bookに対して、モデルBookのnewメソッドがbook_paramsを引数として呼び出す
    # バリデーションが設定されたことによりローカル変数からインスタンス変数に修正
    @book = Book.new(book_params)
    # 上記変数のbookに対してsaveメソッドを設定
    if @book.save
    # 詳細画面(show)へページ遷移,flashメッセージの表示
      redirect_to book_path(@book.id), flash: {success: "Book was successfully created."}
    else
      @books = Book.all
      render :index
    end
  end

  # 詳細画面
  def show
    @book = Book.find(params[:id])
  end

  # 編集画面
  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to book_path(@book.id), flash: {success: "Book was successfully updated."}
    else
      render :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to "/books", flash: {success: "Book was successfully destroyed."}
    else
      render :index
    end
  end


  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end


end
