class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name
      t.string :birth_country
      t.integer :weight
      t.string :birth_state
      t.string :height
      t.string :bats
      t.string :throws
      t.string :position
      t.integer :batting_average
      t.integer :home_runs
      t.integer :RBI
      t.integer :XBH
      t.integer :SO
      t.integer :K
      t.integer :ERA
      t.integer :IBB
      t.integer :XBH
      t.integer :OBP
      t.integer :R
      t.integer :AB
      t.integer :hits

      t.timestamps
    end
  end
end
