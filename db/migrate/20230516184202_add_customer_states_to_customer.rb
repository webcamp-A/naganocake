class AddCustomerStatesToCustomer < ActiveRecord::Migration[6.1]
  def change
    add_column :customers, :customer_states, :integer
  end
end
