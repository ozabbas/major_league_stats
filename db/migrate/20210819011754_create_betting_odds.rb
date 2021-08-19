class CreateBettingOdds < ActiveRecord::Migration[6.1]
  def change
    create_table :betting_odds do |t|

      t.timestamps
    end
  end
end
