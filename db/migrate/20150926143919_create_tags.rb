class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :official_name
      t.boolean :is_active

      t.timestamps null: false
    end

    add_index :tags, :name, unique: true
  end
end
