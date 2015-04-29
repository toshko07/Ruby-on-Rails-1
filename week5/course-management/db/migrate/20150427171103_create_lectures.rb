class CreateLectures < ActiveRecord::Migration
  def change
    create_table :lectures do |t|
      t.string :name
      t.text :body

      t.timestamps null: false
    end
    add_index :lectures
  end
end
