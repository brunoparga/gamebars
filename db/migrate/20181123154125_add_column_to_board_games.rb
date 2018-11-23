class AddColumnToBoardGames < ActiveRecord::Migration[5.2]
  def change
    add_column :board_games, :optimal_players, :integer
  end
end
