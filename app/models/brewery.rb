class Brewery < ActiveRecord::Base
  attr_accessible :description, :name, :site_url, :twitter_url
	belongs_to :user

	validates :name,        presence: true
	validates :description, presence: true
	validates :user_id,     presence: true

	default_scope order: 'breweries.created_at DESC'
end
