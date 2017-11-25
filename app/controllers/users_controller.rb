class UsersController < ApplicationController
  before_action :authenticate_user!
  def show
  	@user = User.find(params[:id])
  	@book = Book.new
  end

  # def mypage
  # 	if user_signed_in?
	 #  	redirect_to user_path(current_user.id)
	 #  else
		#   redirect_to top_path
	 #  end
  # end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "気に入ったぞ小僧。ここまではっきりとプロフィールを書き換えるとは。"
    else
      render :edit
    end
  end

  def index
     @book = Book.new
     @users = User.page(params[:page]).reverse_order
  end

  private 
  def user_params
      params.require(:user).permit(:name, :profile_image, :introduction)
  end

end
