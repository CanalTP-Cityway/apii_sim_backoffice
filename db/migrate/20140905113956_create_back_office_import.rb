class CreateBackOfficeImport < ActiveRecord::Migration

  execute <<-SQL
    CREATE TYPE import_result_enum AS ENUM (
      'success',
      'fail'
    );
  SQL

  def change
    create_table :back_office_import do |t|
      t.date :start_date
      t.date :end_date
      t.column :result, :import_result_enum
      t.integer :nb_stops
      t.integer :nb_new_stops
      t.integer :nb_updated_stops
      t.integer :nb_deleted_stops
      t.integer :nb_transfers
      t.integer :nb_new_transfers
      t.integer :nb_updated_transfers
      t.integer :nb_deleted_transfers
      t.integer :nb_mis_connections
      t.integer :nb_new_mis_connections
      t.integer :nb_deleted_mis_connections
    end
  end
end
