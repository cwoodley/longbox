class AddIndexToSeriesName < ActiveRecord::Migration
  def change
	  add_index :series, :title, unique: true
  end
end
