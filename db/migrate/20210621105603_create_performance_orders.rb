class CreatePerformanceOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :performance_orders do |t|
      t.references :performance, foreign_key: true

      t.timestamps
    end
  end
end
