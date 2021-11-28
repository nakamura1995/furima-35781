class CreateExplanations < ActiveRecord::Migration[6.0]
  def change
    create_table :explanations do |t|

      t.timestamps
    end
  end
end
