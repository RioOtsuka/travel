class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :spot
      t.string :image
      t.integer :score
      t.text :body
      t.integer :lat
      t.integer :lng
      t.integer :user_id

      t.timestamps
    end
  end
end
