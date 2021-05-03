class GroupsController < ApplicationController
    before_action :authenticate_group!, except: [:index]
  
    def index
      @groups = Group.all
    end
  
    def show
      @group = Group.find(params[:id])
    end
  
    def edit
      @group = Group.find(params[:id])
      if @group != current_group
        redirect_to groups_path, alert: "不正なアクセスです。"
      end
  
    end
  
    def update
      @group = Group.find(params[:id])
      if  @group.update(group_params)
        redirect_to group_path(@group), notice: "更新に成功しました。"
      else
        render :edit
      end
    end
  
    private
    def group_params
      params.require(:group).permit(:name, :image ).merge(group_id: current_group.id)
    end

  
  end
  