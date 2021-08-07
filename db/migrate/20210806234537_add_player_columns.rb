class AddPlayerColumns < ActiveRecord::Migration[6.1]
  def change
    add_column :players, :home_run, :integer
    add_column :players, :rbi, :integer
    add_column :players, :avg, :float
    add_column :players, :team_name, :string
    add_column :players, :position, :string
    add_column :players, :era, :float
    add_column :players, :whip, :float
    

  end
end
