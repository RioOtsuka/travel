class AddAddressToTweets < ActiveRecord::Migration[6.1]
  def change
    add_column :tweets, :address, :string
  end
end
