class BarBoardGame < ApplicationRecord
  belongs_to :bar
  belongs_to :board_game
end
