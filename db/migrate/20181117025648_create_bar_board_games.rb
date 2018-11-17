class CreateBarBoardGames < ActiveRecord::Migration[5.2]
  def change
    create_table :bar_board_games do |t|
      t.references :bar, foreign_key: true
      t.references :board_game, foreign_key: true

      t.timestamps
    end
  end
end
