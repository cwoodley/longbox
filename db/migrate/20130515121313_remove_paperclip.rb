class RemovePaperclip < ActiveRecord::Migration
  def up
  	remove_column :issues, :cover_file_name
  	remove_column :issues, :cover_content_type
  	remove_column :issues, :cover_file_size
  	remove_column :issues, :cover_updated_at
  end

  def down
  end
end
