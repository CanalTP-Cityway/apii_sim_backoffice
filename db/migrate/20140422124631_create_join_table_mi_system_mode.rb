class CreateJoinTableMiSystemMode < ActiveRecord::Migration
  def change
    create_join_table :mi_systems, :modes do |t|
      t.index [:mi_system_id, :mode_id]
      # t.index [:mode_id, :mi_system_id]
    end
  end
end
