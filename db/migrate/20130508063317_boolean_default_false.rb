class BooleanDefaultFalse < ActiveRecord::Migration
  def up
  end

  def down
  end
  
  def change
	  change_column :series, :pull, :boolean, :default=>false
  end
end
