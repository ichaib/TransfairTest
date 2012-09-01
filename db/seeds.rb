# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..10).each do |i|
    ServicePartner.create
end


(1..20).each do |i|
    Job.create(rating_client: 1 + rand(4))
end

(1..30).each do |i|
    Employment.create({rating_servicepartner: 1 + rand(4), service_partner_id: ServicePartner.all[rand(ServicePartner.count)], job: Job.all[rand(Job.count)]})
end
