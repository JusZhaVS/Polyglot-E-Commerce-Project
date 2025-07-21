class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :post, null: false, foreign_key: true
      t.string :author_name, null: false
      t.string :author_email, null: false
      t.text :content, null: false
      t.boolean :approved, default: false
      
      t.timestamps
    end
    
    add_index :comments, :approved
    add_index :comments, :created_at
  end
end