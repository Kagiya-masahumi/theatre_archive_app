class PerformStepsController < ApplicationController
  before_action :redirect_to_index_from_company,only: :company_perform_step_index
  def index
  end

  def registration
    @performance = Performance.new
    @company = Company.new
  end

  # 図❶の処理
  def first_validation
    #入力値を全てsessionに保存
    session[:title] = performance_params[:title]
    session[:explain] = performance_params[:explain]
    session[:start_date] = performance_params[:start_date]
    session[:finish_date] = performance_params[:finish_date]
    session[:time_table] = performance_params[:time_table]
    session[:price] = performance_params[:price]
    session[:image] = performance_params[:image]
    session[:video] = performance_params[:video]
    session[:group_id] = current_group.id
  
    #バリデーション判定用にuserをnewします
    @performance = Performance.new(
      title: session[:title],
      explain: session[:explain],
      start_date: session[:start_date],
      finish_date: session[:finish_date],
      time_table: session[:time_table],
      price: session[:price],
      image: session[:image],
      video: session[:video],
      group_id: session[:group_id]

      
    )
    #プロフィールも同様にnewします。未入力の項目はバリデーションに引っかからない値を仮置きします
    @company = Company.new(
      performance: @performance,
      player: "田中",
      staff: "山田",
      writer: "佐藤",
      directer: "加藤",
      place: "オンライン",
      play_hour: '1',
      play_minutes: '30',
      audience: '1',
      rest: '1',
      other_notice: "特になし",

    )
    # バリデーションエラーを事前に取得させる（下のunlessでは全て取得できない場合があるため）
    check_performance_valid = @performance.valid?
    check_company_valid = @company.valid?
    #ユーザー、プロフィールのバリデーション判定
    unless  check_performance_valid && check_company_valid
      render 'perform_steps/registration' 
    else
      # 問題がなければsession[:through_first_valid]を宣言して次のページへリダイレクト
      session[:through_first_valid] = "through_first_valid"
      redirect_to company_perform_steps_path
    end
  end

  def company_registration
    @company = Company.new
  end

  def second_validation
    #入力値を全てsessionに保存
    binding.pry
    session[:title] = performance_params[:title]
    session[:explain] = performance_params[:explain]
    session[:start_date] = performance_params[:start_date]
    session[:finish_date] = performance_params[:finish_date]
    session[:time_table] = performance_params[:time_table]
    session[:price] = performance_params[:price]
    session[:image] = performance_params[:image]
    session[:video] = performance_params[:video]
    session[:player] = company_params[:player]
    session[:staff] = company_params[:staff]
    session[:writer] = company_params[:writer]
    session[:directer] = company_params[:directer]
    session[:place] = company_params[:place]
    session[:play_hour] = company_params[:play_hour]
    session[:play_minutes] = company_params[:play_minutes]
    session[:audience] = company_params[:audience]
    session[:rest] = company_params[:rest]
    session[:other_notice] = company_params[:other_notice]
    session[:group_id] = current_group.id
  
    #バリデーション判定用にuserをnewします
    @performance = Performance.new(
      title: session[:title],
      explain: session[:explain],
      start_date: session[:start_date],
      finish_date: session[:finish_date],
      time_table: session[:time_table],
      price: session[:price],
      image: session[:image],
      video: session[:video],
      
      group_id: session[:group_id]

      
    )
    #プロフィールも同様にnewします。未入力の項目はバリデーションに引っかからない値を仮置きします
    @company = Company.new(
      performance: @performance,
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


    )
    # バリデーションエラーを事前に取得させる（下のunlessでは全て取得できない場合があるため）
    check_performance_valid = @performance.valid?
    check_company_valid = @company.valid?
    #ユーザー、プロフィールのバリデーション判定
    unless  check_performance_valid && check_company_valid
      render 'perform_steps/registration' 
    else
      # 問題がなければsession[:through_first_valid]を宣言して次のページへリダイレクト
      session[:through_first_valid] = "through_first_valid"
      redirect_to company_perform_steps_path
    end
  end

  def create
    @performance = Performance.new( title: session[:title],
                                    explain: session[:explain],
                                    start_date: session[:start_date],
                                    finish_date: session[:finish_date],
                                    time_table: session[:time_table],
                                    price: session[:price],
                                    image: session[:image],
                                    video: session[:video],
                                  ).merge(group_id: current_group.id)
    # 万一ユーザーがcreateできなかった場合、全sessionをリセットして登録ページトップへリダイレクト
    unless @performance.save
      reset_session
      redirect_to registration_perform_steps_path
      return
    end

    @company = Company.create(
      performance: @performance,
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
    )
    if @creditcard.save
      reset_session
      session[:id] = @user.id
      redirect_to done_perform_steps_path
      return 
    else
      #失敗したらsessionを切って登録ページトップへリダイレクト
      reset_session
      redirect_to registration_perform_steps_path
    end
  end

  def  done_perform_steps
    # session[id]がなければ登録ページトップへリダイレクト
    unless session[:id]
      redirect_to registration_perform_steps_path 
      return
    end
    redirect_to performances_path
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
                                        )
                                .merge(group_id: current_group.id)
  end

  def company_params
    params.require(:company).permit(:player,
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

    # 前のpostアクションで定義されたsessionがなかった場合登録ページトップへリダイレクト
  def redirect_to_index_from_sms
    redirect_to registration_perform_step_index_path unless session[:through_first_valid].present? && session[:through_first_valid] == "through_first_valid"
  end
end
