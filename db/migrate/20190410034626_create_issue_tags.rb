class CreateIssueTags < ActiveRecord::Migration[6.0]
  def change
    create_table :issue_tags do |t|
      t.references :issue, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true
      t.timestamps
    end

    add_index :issue_tags, %i(issue_id tag_id), unique: true
  end
end
