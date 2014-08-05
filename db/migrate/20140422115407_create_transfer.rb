class CreateTransfer < ActiveRecord::Migration

  execute <<-SQL
    CREATE TYPE modification_state_enum AS ENUM (
      'auto',
      'manual',
      'validation_needed',
      'recalculate'
    );
  SQL

  def change
    create_table :transfer do |t|
      t.references :stop1, table_name: "stop", index: true, null: false
      t.references :stop2, table_name: "stop", index: true, null: false
      t.integer :distance, null: false
      t.integer :duration, null: false
      t.integer :prm_duration
      t.boolean :active, default: true, null: false
      t.column :modification_state, :modification_state_enum

      t.timestamps
    end
  end
end
