class AddCoverToVolumes < ActiveRecord::Migration
  def change
    add_column :volumes, :cover, :string
  end
end
