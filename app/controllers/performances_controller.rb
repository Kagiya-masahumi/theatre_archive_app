class PerformancesController < ApplicationController
  before_action :authenticate_group!,except: [:index,:show]
  

  def index
    @performances = Performance.all.order("created_at DESC")
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

  def set_perform_info(performance_params)
    Performance.new(
      title: performance_params[:title],
      explain: performance_params[:explain],
      start_date: performance_params[:start_date],
      finish_date: performance_params[:finish_date],
      #image: performance_params[:image],
      video: performance_params[:video],
      time_table: performance_params[:time_table],
      price: performance_params[:price],
      player: performance_params[:player],
      place: performance_params[:place],
      staff: performance_params[:staff],
      writer: performance_params[:writer],
      directer: performance_params[:directer],
      play_hour: performance_params[:play_hour],
      play_minutes: performance_params[:play_minutes],
      audience: performance_params[:audience],
      rest: performance_params[:rest],
      other_notice: performance_params[:other_notice],
      group_id: performance_params[:group_id]
    )
  end

end