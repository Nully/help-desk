class AddColumnIssueState < ActiveRecord::Migration[6.0]
  def change
    add_column :issues, :issue_state, :string, null: false, default: :opening
  end
end
