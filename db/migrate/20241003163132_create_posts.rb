class CreatePosts < ActiveRecord::Migration[6.1]
  def up
    create_table :posts do |t|
      t.string :status
      t.string :region
      t.integer :user_id
      t.text :text

      t.timestamps
    end
  end
  def down
    drop_table :posts
  end
end
