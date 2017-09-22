class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :body
      t.string :image
      t.bigint :user_id

      t.timestamps
    end
  end
end
