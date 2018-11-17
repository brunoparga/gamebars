class CreateBars < ActiveRecord::Migration[5.2]
  def change
    create_table :bars do |t|
      t.string :name
      t.string :address
      t.references :owner, foreign_key: {to_table: :users}

      t.timestamps
    end
  end
end
