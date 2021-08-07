class Team < ApplicationRecord
  has_many :player_teams
  belongs_to :user
end