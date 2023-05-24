class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :postal_code, null:false
      t.string :address, null:false
      t.string :addressee, null:false
      t.integer :postage, null:false
      t.integer :payment, null:false
      t.integer :payment_method, null:false
      t.integer :customer_id, null:false
      t.timestamps
    end
  end
end
