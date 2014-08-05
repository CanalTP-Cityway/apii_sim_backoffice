class CreateStop < ActiveRecord::Migration

  execute <<-SQL
    CREATE TYPE stop_type_enum AS ENUM (
      'GL',
      'LAMU',
      'ZE'
    );
  SQL

  def change
    create_table :stop do |t|
      t.string :code, limit: 50, null: false
      t.references :mis, index: true, null: false
      t.string :name, limit: 255, null: false
      t.decimal :lat, precision: 19, scale: 16, null: false
      t.decimal :lon, precision: 19, scale: 16, null: false
      t.column :stop_type, :stop_type_enum
      t.string :administrative_code, limit: 255
      t.integer :parent_id
      t.column :transport_mode, :transport_mode_enum
      t.string :quay_type, limit: 255
      t.spatial  "geog",    :limit => {:srid=>4326, :type=>"point", :geographic=>true}
      t.spatial  "geom",    :limit => {:geographic=>false}

      t.timestamps
    end
  end
end
