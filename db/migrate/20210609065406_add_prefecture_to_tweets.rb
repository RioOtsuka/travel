class AddPrefectureToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :prefecture_id, :integer
  end
end
