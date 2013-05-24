class CreateBreweries < ActiveRecord::Migration
  def change
    create_table :breweries do |t|
      t.string :name
      t.text :description
      t.string :site_url
      t.string :twitter_url
			t.integer :user_id

      t.timestamps
    end
		add_index :breweries, [:user_id, :created_at]
  end
end
