class CreatePerformances < ActiveRecord::Migration[6.0]
  def change
    create_table :performances do |t|
      t.string :title, null: false
      t.text :explain, null:false
      t.date :start_date, null:false
      t.date :finish_date, null:false
      t.string :video

      t.text :time_table, null: false
      t.integer :price, null: false
      t.string :place, null:false
      t.text :staff, null:false
      t.text :player, null:false
      t.string :writer, null:false
      t.string :director, null: false
      t.integer :audience, null: false
      t.integer :rest, null: false
      t.text :other_notice
      t.integer :play_hour, null: false
      t.integer :play_minutes, null: false
      
      
      t.references :group ,null: false, foreign_key: true


      t.timestamps
    end
  end
end
