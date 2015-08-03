class CreateDrawings < ActiveRecord::Migration
  def change
    create_table :drawings do |t|
      t.integer :user_id
      t.integer :des_id
      t.integer :counter
      t.boolean :parent
      t.boolean :active

      t.timestamps null: false
    end
  end
end
