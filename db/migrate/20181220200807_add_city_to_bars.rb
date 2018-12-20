class AddCityToBars < ActiveRecord::Migration[5.2]
  def change
    add_column :bars, :city, :string
  end
end
