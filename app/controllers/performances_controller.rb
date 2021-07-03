class PerformancesController < ApplicationController
  before_action :authenticate_group!,except: [:index,:show, :order]
  before_action :set_performance, only: [:show, :edit, :update, :order]
  

  def index
    @performances = Performance.all.order("created_at DESC")
    @groups = Group.all

    if params[:tag]
      @performances = Performance.tagged_with(params[:tag]).order("created_at DESC")
    else
      @performances = Performance.all.order("created_at DESC")
    end

  end


  def show
    @comment = Comment.new
    @comments = @performance.comments.includes(:user)
  end

  def edit
    if @performance.group != current_group
      redirect_to performances_path, alert: "不正なアクセスです。"
    end

  end

  
  def update
    if @performance.update(performance_params)
      redirect_to performance_path(performance_params), notice: "更新が成功しました。"
    else
      render :edit
    end
  end


  def destroy
    performance = Performance.find(params[:id])
    performance.destroy
    redirect_to performances_path
  end

  def order
    redirect_to new_card_path and return unless current_user.card.present?
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer_id = current_user.card.customer_id # ログインしているユーザーの顧客トークンを定義
    Payjp::Charge.create(
      amount: @performance.price,  # 商品の値段
      customer: customer_id, # 顧客のトークン
      currency: 'jpy'  # 通貨の種類（日本円）
    )

    PerformanceOrder.create(performance_id: params[:id])  # 商品のid情報を「performance_id」として保存する

    redirect_to root_path

  end


  

  private
  def performance_params
    params.require(:performance).permit(:title,
                                        :explain, 
                                        :start_date, 
                                        :finish_date, 
                                        :image,
                                        :video,
                                        :time_table,
                                        :price,
                                        :player,
                                        :staff, 
                                        :place,
                                        :writer,
                                        :directer,
                                        :play_hour,
                                        :play_minutes,
                                        :audience,
                                        :rest,
                                        :other_notice,
                                        :tag_list
                                      ).merge(group_id: current_group.id)
  end

  def set_performance
    @performance = Performance.find(params[:id])
  end

end