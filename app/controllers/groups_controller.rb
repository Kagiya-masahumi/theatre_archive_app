class GroupsController < ApplicationController
  def index
    @groups = Group.all
  end

  def show
  end

  def edit
  end
end
