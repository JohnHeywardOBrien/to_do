class CreateTodos < ActiveRecord::Migration
  def change
    create_table :todos do |t|
      t.string :title
      t.text :body
      t.date :completed
      t.date :created
      
      t.timestamps null: false
    end
  end
end

