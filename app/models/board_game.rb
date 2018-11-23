class BoardGame < ApplicationRecord
  has_many :bar_board_games, dependent: :destroy
  has_many :bars, through: :bar_board_games
  validates :name, presence: true, uniqueness: true
  validates :min_players, numericality: { only_integer: true }
  validates :max_players,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: :min_players }
  validates :min_playing_time, numericality: { only_integer: true }
  validates :max_playing_time,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: :min_playing_time }
  validates :optimal_players,
            numericality: { only_integer: true,
                            greater_than_or_equal_to: :min_players,
                            less_than_or_equal_to: :max_players }
end
