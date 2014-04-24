class CreateModes < ActiveRecord::Migration
  def change
    create_table :modes do |t|
      t.string :mode_code, limit: 50, null: false
      t.text :mode_description, limit: 255

      t.timestamps
    end
    add_index :modes, :mode_code, unique: true
  end
end
