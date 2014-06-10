class AddValidityToConnections < ActiveRecord::Migration
  def change
    add_column :connections, :validity, :boolean, :default => true
  end
end
