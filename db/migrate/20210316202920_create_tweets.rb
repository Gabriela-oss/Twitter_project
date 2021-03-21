class CreateTweets < ActiveRecord::Migration[6.1]
  def change
    create_table :tweets do |t|
      t.text :content
      t.belongs_to :user, null: false, foreign_key: true
      t.string :photo
      t.integer :retweets
      t.boolean :active, default: true

      t.timestamps
    end
  end
end
