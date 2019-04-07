class AddColumnCommentCount < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :comment_count, :integer, default: 0, null: false
  end
end
