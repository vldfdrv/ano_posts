class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :login
      t.string :password_digest

      t.string :firstname
      t.string :lastname
      t.string :prename

      t.string :region
      t.boolean :admin, default: false

      t.timestamps
    end
  end
end
