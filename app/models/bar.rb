class Bar < ApplicationRecord
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"
  has_many :bar_board_games, dependent: :destroy
  has_many :board_games, through: :bar_board_games

  %i[name address city opening_hours].each do |attribute|
    validates attribute, presence: true
  end
end
