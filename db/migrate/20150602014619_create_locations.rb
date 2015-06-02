class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :description
      t.string :name
      t.time :opening_time
      t.time :closing_time

      t.timestamps

    end
  end
end
