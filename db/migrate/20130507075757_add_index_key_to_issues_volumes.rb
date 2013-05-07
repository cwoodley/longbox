class AddIndexKeyToIssuesVolumes < ActiveRecord::Migration
  def change
    add_index :issues, [:series_id, :created_at]
    add_index :volumes, [:series_id, :created_at]
  end
end
