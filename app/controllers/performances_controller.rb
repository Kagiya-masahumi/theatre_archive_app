class PerformancesController < ApplicationController
  before_action :authenticate_group!,except: [:index]

  def index
    @performances = Performance.all
    
  end

  def show
    @performance = Performance.find(params[:id])
  end

  def new
    @performance = Performance.new
  end

  def edit
    @performance = Performance.find(params[:id])
    if @performance.group != current_group
      redirect_to performances_path, alert: "不正なアクセスです。"
    end

  end

  def create
    @performance = Performance.new(performance_params)
    if @performance.save
      redirect_to performances_path(@performance), notice: "投稿に成功しました。"
    else
      render :new
      
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
  def performance_params
    params.require(:performance).permit(:title, :explain, :player,:staff, :place, :start_date, :finish_date, :image)
                                .merge(group_id: current_group.id)
  end

end