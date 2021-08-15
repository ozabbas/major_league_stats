class AddColumnsSecond < ActiveRecord::Migration[6.1]
  def change

    # batting
    add_column :players, :ab, :integer
    add_column :players, :r, :integer
    add_column :players, :h, :integer
    add_column :players, :sb, :integer
    add_column :players, :obp, :float
    add_column :players, :ops, :float
    # pitching
    add_column :players, :wpct, :float
    add_column :players, :g, :integer
    add_column :players, :gs, :integer
    add_column :players, :sv, :integer
    add_column :players, :ip, :integer
    add_column :players, :so, :integer
  end
end
