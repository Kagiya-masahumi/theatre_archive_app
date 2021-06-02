class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  

  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @performances = @user.performances

    favorites = Favorite.where(user_id: current_user.id).pluck(:performance_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorite_list = Performance.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: "不正なアクセスです。"
    end

  end

  def update
    @user = User.find(params[:id])
    if  @user.update(user_params)
      redirect_to user_path(@user), notice: "更新に成功しました。"
    else
      render :edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :email, :profile, :image).merge(user_id: current_user.id)
  end
  
  
end

