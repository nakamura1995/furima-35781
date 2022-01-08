class CreateDay < ActiveRecord::Migration[6.0]
  def change
    create_table :day do |t|

      t.timestamps
    end
  end
end
