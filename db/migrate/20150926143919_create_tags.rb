class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :name
      t.string :official_name
      t.boolean :is_active

      t.timestamps null: false
    end
  end
end
