class CreateVolumes < ActiveRecord::Migration
  def change
    create_table :volumes do |t|
      t.integer :volume_number
      t.integer :series_id
      t.boolean :own

      t.timestamps
    end
  end
end
