class RemovePicture < ActiveRecord::Migration
  def up
  end

  def down
  	remove_column :issues, :picture
  end
  
end
