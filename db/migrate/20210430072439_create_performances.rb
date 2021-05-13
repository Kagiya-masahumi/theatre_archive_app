class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.string :title, null: false
      t.text :explain, null:false
      t.date :start_date, null:false
      t.date :finish_date, null:false
      t.string :place, null:false
      t.text :staff, null:false
      t.text :player, null:false
      t.string :video_top, null: false
      t.string :designer_name
      t.string :designer_URL
      t.text :time_table, null: false
      t.string :writer, null:false
      t.string :directer, null: false
      t.integer :play_hour, null: false

      t.integer :rest_time, null: false
      t.text :other_notice
      t.references :group ,null: false, foreign_key: true


      t.timestamps
    end
  end
end
