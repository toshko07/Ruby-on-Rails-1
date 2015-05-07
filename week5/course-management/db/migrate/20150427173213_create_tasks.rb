class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.belongs_to :lectures, foreign_key: true, allow_destroy: true
      t.string :name, null: false
      t.text :description, null: false

      t.timestamps null: false
    end
    add_index :tasks
  end
end
