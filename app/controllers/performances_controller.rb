class PerformancesController < ApplicationController
  def index
    @groups = Group.all
  end

end
