class Bar < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :bar_board_games
  has_many :board_games, through: :bar_board_games

  validates :name, presence: true
  validates :address, presence: true
end
