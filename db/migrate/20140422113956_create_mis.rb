class CreateMis < ActiveRecord::Migration
  def change
    create_table :mis do |t|
      t.string :name, limit: 50, null: false
      t.text :comment, limit: 255
      t.string :api_url, limit: 255, null: false
      t.string :api_key, limit: 255
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :geographic_position_compliant
      t.integer :multiple_start_and_arrivals

      t.timestamps
    end
    add_index :mis, :name, unique: true
    add_index :mis, :api_url, unique: true
  end
end
