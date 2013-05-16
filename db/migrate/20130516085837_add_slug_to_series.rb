class AddSlugToSeries < ActiveRecord::Migration
  def change
    add_column :series, :slug, :string
    add_index :series, :slug, unique: true
  end
end
