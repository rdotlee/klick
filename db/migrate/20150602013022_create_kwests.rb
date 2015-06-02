class CreateKwests < ActiveRecord::Migration
  def change
    create_table :kwests do |t|
      t.string :name
      t.integer :year

      t.timestamps

    end
  end
end
