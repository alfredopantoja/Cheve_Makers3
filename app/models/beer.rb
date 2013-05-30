class Beer < ActiveRecord::Base
  attr_accessible :description, :name, :beer_type
	belongs_to :user

	validates :name,        presence: true
	validates :beer_type,   presence: true
	validates :description, presence: true
	validates :user_id,     presence: true

	default_scope order: 'beers.created_at DESC'
end
