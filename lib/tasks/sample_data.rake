namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    naveed=User.create!(name: "naveed",
                 email: "nav0285@gmail.com",
                 password: "12345",
                 password_confirmation: "12345")
    naveed.toggle!(:admin)
    99.times do |n|
       name = Faker::Name.name
       email = "example.#{n+1}@railstutorial.org"
       password = "password"
       User.create!(name: name,
                    email: email,
                    password: password,
                    password_confirmation: password)
    end
  end
end
