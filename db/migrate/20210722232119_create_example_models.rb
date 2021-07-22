class CreateExampleModels < ActiveRecord::Migration[6.1]
  def change
    create_table :example_models do |t|

      t.timestamps
    end
  end
end
