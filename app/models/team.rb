class Team < ApplicationRecord
  has_many :player_teams
  belongs_to :user
  has_many :players, through: :player_teams
end