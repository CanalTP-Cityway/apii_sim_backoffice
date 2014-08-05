class CreateMisModeJoinTable < ActiveRecord::Migration
  def change
    create_table :mis_mode do |t|
      t.integer :mis_id, null: false
      t.integer :mode_id, null: false
    end
  end
end
