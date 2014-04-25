class CreateMiSystems < ActiveRecord::Migration
  def change
    create_table :mi_systems do |t|
      t.string :name, limit: 50, null: false
      t.text :comment, limit: 255
      t.text :api_url, limit: 255, null: false
      t.text :api_key, limit: 255
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.integer :multiple_starts_and_arrivals

      t.timestamps
    end
    add_index :mi_systems, :name, unique: true
    add_index :mi_systems, :api_url, unique: true
  end
end
