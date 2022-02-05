class CreateStatuses < ActiveRecord::Migration[7.0]
  def change
    create_table :statuses do |t|
      t.string :address
      t.integer :current_balance
      t.integer :confirmed_balance
      t.integer :total_ether_deposited
      t.integer :total_ether_deducted
      t.integer :transaction_count

      t.timestamps
    end
  end
end
