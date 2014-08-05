class CreateMode < ActiveRecord::Migration

  execute <<-SQL
    CREATE TYPE transport_mode_enum AS ENUM (
      'all',
      'bus',
      'trolleybus',
      'tram',
      'coach',
      'rail',
      'intercityrail',
      'urbanrail',
      'metro',
      'air',
      'water',
      'cable',
      'funicular',
      'taxi',
      'bike',
      'car'
    );
  SQL

  def change
    create_table :mode do |t|
      t.column :code, :transport_mode_enum, null: false
      t.text :description

      t.timestamps
    end
    add_index :mode, :code, unique: true
  end
end
