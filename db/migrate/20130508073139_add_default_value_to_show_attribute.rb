class AddDefaultValueToShowAttribute < ActiveRecord::Migration
	def up
	    change_column :series, :pull, :boolean, :default => false, :null => false
	end
	
	def down
	end
end
