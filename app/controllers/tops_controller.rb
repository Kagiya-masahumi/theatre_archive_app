class TopsController < ApplicationController
  def index
  end

  def new
    @top = Top.new #←ここを追記
  end

  def create
    @top = Top.new(tops_params) #←ここを追記
    @top.save! #←保存だけします 「!」をつける事でエラーを表示してくれます。
  end


  private

#ここからがデータを許可する記述
  def tops_params
    params.require(:top).permit(:video_top)
  end
end
