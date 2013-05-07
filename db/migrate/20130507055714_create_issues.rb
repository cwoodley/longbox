class CreateIssues < ActiveRecord::Migration
  def change
    create_table :issues do |t|
      t.integer :issue_number
      t.integer :series_id
      t.boolean :own

      t.timestamps
    end
  end
end
