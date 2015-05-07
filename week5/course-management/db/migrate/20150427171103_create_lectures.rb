class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name, null: false
      t.text :body, null: false

      t.timestamps null: false
    end
    add_index :lectures
  end
end
