class CreateGreetings < ActiveRecord::Migration
  def change
    create_table :greetings do |t|
      t.belongs_to :user, null: false 
      t.integer :reciever_id, null: false 
      t.string :body, null: false

      t.timestamps null: false
    end
  end
end
