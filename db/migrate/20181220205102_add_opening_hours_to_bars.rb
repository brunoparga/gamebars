class AddOpeningHoursToBars < ActiveRecord::Migration[5.2]
  def change
    add_column :bars, :opening_hours, :text
  end
end
