class CreatePlayerTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :player_teams do |t|

      t.timestamps
    end
  end
end
