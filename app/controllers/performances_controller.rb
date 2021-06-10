class PerformancesController < ApplicationController
  before_action :authenticate_group!,except: [:index,:show]
  before_action :set_performance, only: [:show, :edit, :update]
  

  def index
    @performances = Performance.all.order("created_at DESC")
    @groups = Group.all
    @tags1 = ActsAsTaggableOn::Tag.where("id < ?", 10)
    @tags2 = ActsAsTaggableOn::Tag.where(id: 11..22)
    @tags3 = ActsAsTaggableOn::Tag.where(id: 23...29)
    @tags4 = ActsAsTaggableOn::Tag.where(id: 29...31)





    if params[:tag_name]
      @performances = Performance.tagged_with("#{params[:tag_name]}").includes(:group).order("created_at DESC")
    else
      @performances = Performance.all.includes(:group).order("created_at DESC")
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
                                        :other_notice,
                                        :tag_list
                                      ).merge(group_id: current_group.id)
  end

  def set_performance
    @performance = Performance.find(params[:id])
  end

end