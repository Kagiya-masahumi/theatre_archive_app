class CreatePerformTags < ActiveRecord::Migration[6.0]
  def change
    create_table :perform_tags do |t|
      t.references :performance, foreign_key: true
      t.references :tag, foreign_key: true

      t.timestamps
    end
  end
end
