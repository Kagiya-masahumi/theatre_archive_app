FactoryBot.define do
  factory :performance do

    id              {Faker::Number.number(digits:2)}
    title{'テスト'}
    explain{'これはテストです。'}
    start_date{} #日付(date)のテストコードの値を調べる
    finish_date{} #同上
    time_table{}
    price{}
    place{}
    play_hour{}
    play_minutes{}
    player{}
    staff{}
    writer{}
    director{}
    audience{}
    rest{}
    other_notice{}
    group

    
  end
end
