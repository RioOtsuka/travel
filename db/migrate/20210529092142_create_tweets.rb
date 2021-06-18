class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :spot
      t.string :image
      t.integer :score
      t.text :body
      t.float :latitude
      t.float :longitude
      t.integer :user_id
      t.string :prefecture

      t.timestamps
    end
  end
end
