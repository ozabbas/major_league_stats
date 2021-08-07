class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :email, unique: true
      t.integer :favorite_team_id
      t.string :password_digest
      t.timestamps
    end
  end
end
