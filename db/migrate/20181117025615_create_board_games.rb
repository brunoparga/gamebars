class CreateBoardGames < ActiveRecord::Migration[5.2]
  def change
    create_table :board_games do |t|
      t.string :name
      t.integer :min_players
      t.integer :max_players
      t.integer :min_playing_time
      t.integer :max_playing_time

      t.timestamps
    end
  end
end
