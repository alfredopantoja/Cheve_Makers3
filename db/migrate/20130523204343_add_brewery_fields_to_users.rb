class AddBreweryFieldsToUsers < ActiveRecord::Migration
  def change
		add_column :users, :description, :text
		add_column :users, :site_url, :string
		add_column :users, :twitter_url, :string		
  end
end
