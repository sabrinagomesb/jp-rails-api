class RemoveCityAndStateFromAddresses < ActiveRecord::Migration[7.0]
  def change
    remove_column :addresses, :city, :string
    remove_column :addresses, :state, :string
  end
end
