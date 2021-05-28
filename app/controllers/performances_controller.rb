class PerformancesController < ApplicationController
  before_action :authenticate_group!,except: [:index]
  

  def index
    @performances = Performance.all
  end


  def show
    @performance = Performance.find(params[:id])
  end

  def edit
    @performance = Performance.find(params[:id])
    if @performance.group != current_group
      redirect_to performances_path, alert: "不正なアクセスです。"
    end

  end

  
  def update
    @performance = Performance.find(params[:id])
    if @performance.update(performance_params)
      redirect_to performance_path(@performance), notice: "更新が成功しました。"
    else
      render :edit
    end
  end


  def destroy
    performance = Performance.find(params[:id])
    performance.destroy
    redirect_to performances_path
  end
  

  private
  #userとprofileのストロングパラメータ
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
                                        :other_notice
                                      ).merge(group_id: current_group.id)
  end

 
end