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
      t.references :group ,null: false, foreign_key: true


      t.timestamps
    end
  end
end
