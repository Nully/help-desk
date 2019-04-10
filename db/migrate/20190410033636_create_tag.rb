class CreateTag < ActiveRecord::Migration[6.0]
  def change
    create_table :tags do |t|
      t.string :name, null: false, unique: true, index: true
      t.timestamps
    end
  end
end
