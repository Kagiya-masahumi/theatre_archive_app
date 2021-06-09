array = %w(演劇 日本舞踊 バレエ 古典 舞踏 能・狂言 ミュージカル 歌舞伎 コンサート 演奏 東京 神奈川 埼玉 千葉 群馬 茨城 兵庫 北海道 大阪 京都 愛知 福岡 ~1000円 ~3000円 ~5000円 ~10000円 10000円~ )
array.each{ |tag|
  tag_list = ActsAsTaggableOn::Tag.new
  tag_list.name = tag
  tag_list.save
}
