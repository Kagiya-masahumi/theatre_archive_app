class PerformStepsController < ApplicationController
  before_action :redirect_to_index_from_company,only: :company_perform_step_index
  def index
  end

  def step1
    @performance = Performance.new
  end


  def step1_validates
    
    @performance = set_perform_info(performance_params)
    @performance.valid?

    skip_company_validate(@performance.errors)
      if @performance.errors.messages.blank? && @performance.errors.details.blank?
          create_session(performance_params)
          redirect_to step2_perform_steps_path and return
      else 
        render :step1
      end
  end

  def step2
    @performance = Performance.new
  end

  def create
    set_perform_with_session
    @performance.video = performance_params[:video]
    @performance.image = performance_params[:image]
    @performance[:player] = performance_params[:player]
    @performance[:staff] = performance_params[:staff]
    @performance[:writer] = performance_params[:writer]
    @performance[:directer] = performance_params[:directer]
    @performance[:other_notice] = performance_params[:other_notice]
    @performance[:group_id] = performance_params[:group_id]

    if @performance.save
      delete_session
      redirect_to root_path
    else
      render :step2
    end  
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

  def set_perform_with_session
    @performance = Performance.new(
      title: session[:title],
      explain: session[:explain],
      start_date: session[:start_date],
      finish_date: session[:finish_date],
      time_table: session[:time_table],
      price: session[:price],
      video: session[:video],
      player: session[:player],
      staff: session[:staff],
      writer: session[:writer],
      directer: session[:directer],
      place: session[:place],
      play_hour: session[:play_hour],
      play_minutes: session[:play_minutes],
      audience: session[:audience],
      rest: session[:rest],
      other_notice: session[:other_notice],
      group_id: session[:group_id]
    )
  end

  def skip_company_validate(errors)
    errors.messages.delete(:video)  
    errors.details.delete(:video)
    errors.messages.delete(:player) 
    errors.details.delete(:player)
    errors.messages.delete(:staff)  
    errors.details.delete(:staff)
    errors.messages.delete(:writer)  
    errors.details.delete(:writer)
    errors.messages.delete(:directer)  
    errors.details.delete(:directer)
    errors.messages.delete(:image)  
    errors.details.delete(:image)
    
    errors.messages.delete(:other_notice) 
    errors.details.delete(:other_notice)
  end

  def create_session(performance_params)
    session[:title] = performance_params[:title]
    session[:explain] = performance_params[:explain]
    session[:start_date] = performance_params[:start_date]
    session[:finish_date] = performance_params[:finish_date]
    session[:time_table] = performance_params[:time_table]
    session[:price] = performance_params[:price]
    #session[:image] = performance_params[:image]
    session[:video] = performance_params[:video]
    session[:player] = performance_params[:player]
    session[:staff] = performance_params[:staff]
    session[:writer] = performance_params[:writer]
    session[:directer] = performance_params[:directer]
    session[:place] = performance_params[:place]
    session[:play_hour] = performance_params[:play_hour]
    session[:play_minutes] = performance_params[:play_minutes]
    session[:audience] = performance_params[:audience]
    session[:rest] = performance_params[:rest]
    session[:other_notice] = performance_params[:other_notice]
    session[:group_id] = current_group.id
  end

  def delete_session
    session.delete(:title)
    session.delete(:explain)
    session.delete(:start_date)
    session.delete(:finish_date)
    session.delete(:time_table)
    session.delete(:price)
    session.delete(:video)
    session.delete(:player)
    session.delete(:staff)
    session.delete(:writer)
    session.delete(:directer)
    session.delete(:place)
    session.delete(:play_hour)
    session.delete(:play_minutes)
    session.delete(:audience)
    session.delete(:rest)
    session.delete(:other_notice)
  end

end