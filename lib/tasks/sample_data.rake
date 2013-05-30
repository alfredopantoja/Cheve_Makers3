namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = User.create!(name: "Example User",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar")
		admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
		users = User.all(limit: 10)
		50.times do
			name = Faker::Name.name
			beer_type = Faker::Lorem.sentence
			description = Faker::Lorem.paragraphs			
			users.each { |user| user.beers.create!(name: name, beer_type: beer_type,
																						 description: description) }
		end	
  end
end
