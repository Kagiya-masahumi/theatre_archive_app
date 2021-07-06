class GroupsController < ApplicationController
    before_action :authenticate_group!, except: [:index,:show]
    before_action :set_group, only:[:show, :edit, :update]
  
    def index
      @groups = Group.all
    end
  
    def show
      @performances = Performance.all.order("created_at DESC")
      # @performance = Performance.find(params[:id])
      
    end
  
    def edit
      if @group != current_group
        redirect_to groups_path, alert: "不正なアクセスです。"
      end
  
    end
  
    def update
      if  @group.update(group_params)
        bypass_sign_in(@group)
        redirect_to root_path, notice: "更新に成功しました。"
      else
        render :edit
      end
    end
  
    private
    def group_params
      params.require(:group).permit(:name, :email, :password, :password_confirmation, :chair_person,:profile ,:image)
    end

    def set_group
      @group = Group.find(params[:id])
    end
    
end
  