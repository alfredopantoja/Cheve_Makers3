FactoryGirl.define do
	factory :user do
		sequence(:name)  { |n| "Person #{n}" }
		sequence(:email) { |n| "person_#{n}@example.com" }		
		password "foobar"
		password_confirmation "foobar"
		
		factory :admin do
			admin true
		end	
	end	

	factory :brewery do
		name        "Senor Beer"
		description "Delicious fucking beer."
		site_url    "www.senorbeer.com"
		twitter_url "www.twitter.com/senorbeer"
		user
	end			
end	
