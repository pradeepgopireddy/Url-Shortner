class CreateShortenedUrls < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
    	t.text :original_url
    	t.string :short_url
    	t.integer :clicks, default: 0
    	t.integer :user_id
      t.timestamps
    end
  end
end
