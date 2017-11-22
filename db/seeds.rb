#require 'faker'

#Gig.where(budget: 'NULL').first_or_create(budget: rand(10..200)*100)

#Gig.update_columns(budget: rand(10..200)*100)

#Gig.where(budget: '').update_all(budget: rand(10..200)*100)

#Gig.where(:budget => '').update_all(:budget => rand(10..200)*100)

#Gig.where(:budget => nil).update_all(:budget => rand(10..200)*100)

#Gig.where(budget: nil).update_all(budget: rand(10..200)*100)

#Gig.budget.update_all(budget: rand(10..200)*100).where(budget: nil)


#require 'faker'
#
#100.times do |t| 
#	Gig.create!(name: Faker::Name.title,  
#						description: Faker::Lorem.paragraph(2),
#						location: Faker::Address.city + Faker::Address.country_code,
#						budget: rand(10..200)*100)
#						user_id: rand(1..4),
#						category_id: rand(1..8))
#end

#namespace :db do
#  desc "Erase and fill database"
#	task :seed => :environment do 
#    require 'faker'
#
#    Rake::Task['db:reset'].invoke
#    
#    # Create 15 posts
#    15.times do
#      Gig.create do |g|
#
#						g.name: Faker::Name.title,  
#						g.description: Faker::Lorem.paragraph(2),
#						g.location: Faker::Address.city + Faker::Address.country_code,
#						g.budget: rand(10..200)*100)
#						g.user_id: rand(1..4),
#						g.category_id: rand(1..8))
#
#      end
#    end
#  end
#end

#
#    require 'faker'  
#    # Create 15 posts
#    100.times do
#      Gig.create(
#						name: Faker::Name.title,  
#						description: Faker::Lorem.paragraph(2),
#						location: Faker::Address.city + ', ' + Faker::Address.country_code_long,
#						budget: rand(10..200)*100,
#						user_id: rand(1..4),
#						category_id: rand(1..8))
#    end


    require 'faker'  
    # Create 15 posts
    153.times do
    	#sleep 0.05
      Gig.create(
						name: Faker::Name.title,  
						description: Faker::Lorem.paragraph(2),
						location: '',
						latitude: '',
						longitude: '', 
						#location: Faker::Address.city + ', ' + Faker::Address.country_code_long,
						#latitude: Faker::Address.latitude,
						#longitude: Faker::Address.longitude, 
						budget: rand(10..200)*100,
						user_id: rand(1..4),
						category_id: rand(1..8))
    end