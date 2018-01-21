class BlogsController < ApplicationController
  before_action:set_blog, only:[:show, :edit, :update, :destroy]

  #HOME、一覧画面を表示
  def index
    @blog = Blog.all
  end

  #詳細画面
  def show
  end

  #編集画面
  def edit
  end

  #編集処理
  def update
    if @blog.update(blog_params)
      #成功の場合
      redirect_to blogs_path, notice: 'ブログの編集が完了しました'
    else
      #失敗の場合
      render 'edit'
    end
  end

  #削除処理
  def destroy
    @blog.destroy
    redirect_to blogs_path, notice: 'ブログの削除が完了しました'
  end

  #新規作成画面
  def new
    if params[:back]
      @blog = Blog.new(blog_params)
    else
      @blog = Blog.new
    end
  end

  #新規作成処理
  def create
    @blog = Blog.new(blog_params)

    if @blog.save
      #成功の場合
      
      #一覧画面へリダイレクト
      redirect_to blogs_path, notice:'新規登録処理が完了しました'
    else
      #失敗の場合

      #新規作成画面を再描画
      render 'new'
    end
  end

  def confirm
    @blog = Blog.new(blog_params)
    render:new if @blog.invalid?
  end

  private

  #ストロングパラメータ
  def blog_params
    params.require(:blog).permit(:title, :content)
  end

  #ブログ情報のセット
  def set_blog
    @blog = Blog.find(params[:id])
  end
end
