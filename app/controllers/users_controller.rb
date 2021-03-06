class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  before_action :set_user, only:[:show, :edit, :update]

  def index
    @users = User.all

  end

  def show
    
    favorites = Favorite.where(user_id: current_user.id).pluck(:performance_id)  # ログイン中のユーザーのお気に入りのpost_idカラムを取得
    @favorite_list = Performance.find(favorites)     # postsテーブルから、お気に入り登録済みのレコードを取得

    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    card = Card.find_by(user_id: current_user.id)
    redirect_to new_card_path and return unless card.present?
    customer = Payjp::Customer.retrieve(card.customer_id) # 先程のカード情報を元に、顧客情報を取得
    @card = customer.cards.first
  end

  def edit
 
    if @user != current_user
      redirect_to users_path, alert: "不正なアクセスです。"
    end

  end

  def update
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

  def set_user
    @user = User.find(params[:id])
  end

  


  
  
end

