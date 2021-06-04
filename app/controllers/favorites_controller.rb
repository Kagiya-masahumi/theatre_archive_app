class FavoritesController < ApplicationController
  #include SessionsHelper


  before_action :authenticate_user!   # ログイン中のユーザーのみに許可（未ログインなら、ログイン画面へ移動）
  before_action :performance_params


  def create
    favorite = current_user.favorites.new(performance_id: @performance.id)
 
    favorite.save
  end

  def destroy

    favorite = current_user.favorites.find_by(performance_id: @performance.id).destroy

  end

  private

  def performance_params
    @performance = Performance.find(params[:perform_id])
    @id_name = "#performance-link-#{ @performance.id }"
    
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
