class CreateBills < ActiveRecord::Migration[7.2]
  def change
    create_table :bills do |t|
      t.decimal :amount
      t.integer :bill_type, default: 0 # Default to 'food'
      t.integer :status, default: 1    # Default to 'pending'
      t.references :employee, null: false, foreign_key: true

      t.timestamps
    end
  end
end
