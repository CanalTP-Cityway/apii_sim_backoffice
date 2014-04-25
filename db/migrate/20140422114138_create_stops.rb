class CreateStops < ActiveRecord::Migration
  def change
    create_table :stops do |t|
      t.integer :stop_code
      t.references :mi_system, index: true
      t.string :name, limit: 255
      t.integer :stop_type
      t.text :administrative_code, limit: 255
      t.integer :site_ref
      t.text :transport_mode, limit: 255
      t.text :quay_type, limit: 255
      t.decimal :lat, precision: 19, scale: 16
      t.decimal :lon, precision: 19, scale: 16
      t.geometry :shape

      t.timestamps
    end
  end
end
