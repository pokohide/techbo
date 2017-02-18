class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.integer :entry_id
      t.text :body
      t.string :from
      t.integer :user_id
      t.string :avatar

      t.timestamps
    end
  end
end
