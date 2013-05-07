class CreateSeries < ActiveRecord::Migration
  def change
    create_table :series do |t|
      t.string :title
      t.boolean :pull

      t.timestamps
    end
  end
end
