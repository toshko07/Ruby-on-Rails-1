class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.belongs_to :task, foreign_key: true, allow_destroy: true
      t.text :body null: false

      t.timestamps null: false
    end
  end
end
