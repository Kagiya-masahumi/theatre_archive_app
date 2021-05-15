class PerformStepsController < ApplicationController

  include Wicked::Wizard
  steps :place,:company

  def show
    @performance = current_performance
    render_wizard
  end

  def update
    @performance = current_performance
    @performance.attributes = performance_params
    render_wizard @performance
  end

  private

  def finish_wizard_path
    users_path(current_user)
  end

  def current_user
    Performance.find_by(id: session[:performance_id])
  end

  def performance_params
    params.require(:performance).permit(:title,
                                        :explain, 
                                        :player,
                                        :staff, 
                                        :place, 
                                        :start_date, 
                                        :finish_date, 
                                        :image,
                                        :video,
                                        :time_table,
                                        :writer,
                                        :directer,
                                        :play_hour,
                                        :play_minutes,
                                        :price,
                                        :audience,
                                        :rest,
                                        :other_notice)
                                  .merge(group_id: current_group.id)
  end
end
