class FavoritesController < ApplicationController
  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）
  before_action :set_performance



  def create
    @favorite = Favorite.create(user_id: current_user.id, performance_id: @performance.id)
  end

  def destroy
    favorite = Favorite.find_by(user_id: current_user.id, performance_id: @performance.id)
    favorite.destroy
    redirect_to performances_path
  end

  private

  def set_performance
    @performance = Performance.find(params[:id])
  end
#   # お気に入り登録
#   def create
#       @favorite = Favorite.create(user_id: current_user.id, performance_id: @performance.id)
#   end
#   # お気に入り削除
#   def destroy
#     @favorite = Favorite.find_by(user_id: current_user.id, performance_id: @performance.id)
#     @favorite.destroy
#   end

  # private
  # def set_performance
  #   @performance = Performance.find(params[:performance_id])
  # end
end
