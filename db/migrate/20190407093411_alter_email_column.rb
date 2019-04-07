class AlterEmailColumn < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :email, :string, null: false, index: true
    add_column :comments, :email, :string, null: false, index: true
  end
end
