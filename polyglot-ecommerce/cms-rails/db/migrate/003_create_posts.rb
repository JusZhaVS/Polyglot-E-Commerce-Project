class CreatePosts < ActiveRecord::Migration[7.0]
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.string :slug, null: false
      t.text :content, null: false
      t.text :excerpt
      t.references :author, null: false, foreign_key: true
      t.boolean :published, default: false
      
      t.timestamps
    end
    
    add_index :posts, :slug, unique: true
    add_index :posts, :published
    add_index :posts, :created_at
  end
end