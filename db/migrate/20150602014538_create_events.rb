class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.text :description
      t.integer :event_type_id
      t.date :date
      t.time :time
      t.integer :location_id
      t.integer :count_registration
      t.integer :group_size

      t.timestamps

    end
  end
end
