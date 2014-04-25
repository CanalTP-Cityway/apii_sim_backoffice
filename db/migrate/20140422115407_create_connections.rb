class CreateConnections < ActiveRecord::Migration
  def change
    create_table :connections do |t|
      t.references :stop_1, table_name: "stops", index: true
      t.references :stop_2, table_name: "stops", index: true
      t.integer :distance
      t.integer :duration
      t.integer :prm_duration

      t.timestamps
    end
  end
end
