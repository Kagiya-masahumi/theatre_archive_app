class CreateCompanies < ActiveRecord::Migration[6.0]
  def change
    create_table :companies do |t|
      t.text :staff, null:false
      t.text :player, null:false
      t.string :writer, null:false
      t.string :directer, null: false
      t.integer :audience, null: false
      t.integer :rest, null: false
      t.text :other_notice
      t.string :place, null:false
      t.integer :play_hour, null: false
      t.integer :play_minutes, null: false
      t.references :performance

      t.timestamps
    end
  end
end
