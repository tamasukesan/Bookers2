class BooksController < ApplicationController
   before_action :authenticate_user!, except: [:top, :about]
  def top
  end

  def new
      @book = Book.new
  end

  def index
  	  @book = Book.new
  	  @books = Book.page(params[:page]).reverse_order
  end

  def create
      @books = Book.page(params[:page]).reverse_order
  	  @book = Book.new(book_params)
      @book.user_id = current_user.id
      if @book.save
      redirect_to book_path(@book.id), notice: "すごい・・・君が熱中するわけだ。"
      else
      render 'index'
      end
  end

  def show
  	  @book = Book.find(params[:id])
      @booknew = Book.new
  end

  def edit
  	  @book = Book.find(params[:id])
  end

  def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path, notice: "悲しいけどねアレ、削除したのよね！"
  end

  def update
  	  @book = Book.find(params[:id])
  	  if @book.update(book_params)
  	  redirect_to book_path, notice: "勝利の栄光を君に！"
      else
      render 'edit'
      end
  end

  private
  def book_params
      params.require(:book).permit(:title, :body)
  end

  private 
  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
