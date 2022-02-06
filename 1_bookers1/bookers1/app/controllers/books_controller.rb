class BooksController < ApplicationController
  # 一覧画面
  def index
    @books = Book.all
  end
  
  # 新規投稿フォーム
  def new
    @book = Book.new
  end
  
  # データの追加・保存
  def create
    # ローカル変数bookに対して、モデルBookのnewメソッドがbook_paramsを引数として呼び出す
    book = Book.new(book_params)
    # 上記変数のbookに対してsaveメソッドを設定
    book.save
    # 詳細画面(show)へページ遷移
    redirect_to "/books/:id"
  end

  # 詳細画面 
  def show
    @book = Book.find(params[:id])
  end

  # 編集画面
  def edit
  end
  
  
  
  private
  # ストロングパラメータ
  def book_params
    params.require(:book).permit(:title, :body)
  end
  
end
