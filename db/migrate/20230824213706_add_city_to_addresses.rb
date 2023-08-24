class AddCityToAddresses < ActiveRecord::Migration[7.0]
  def change
    add_reference :addresses, :city, null: false, foreign_key: true
  end
end
