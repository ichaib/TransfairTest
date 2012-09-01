# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

(1..100).each do |i|
    ServicePartner.create
end


(1..200).each do |i|
    Job.create(rating_client: 1 + rand(4))
end


(1..500).each do |i|
    Employment.create({rating_servicepartner: 1 + rand(4), service_partner_id: ServicePartner.all[rand(ServicePartner.count)], job_id: Job.all[rand(Job.count)]})
end

Employment.create({rating_servicepartner: 5, service_partner_id: 5, job_id: 3})
Employment.create({rating_servicepartner: 5, service_partner_id: 5, job_id: 5})
Employment.create({rating_servicepartner: 5, service_partner_id: 5, job_id: 9})
Employment.create({rating_servicepartner: 5, service_partner_id: 56, job_id: 11})
Employment.create({rating_servicepartner: 5, service_partner_id: 9, job_id: 8})
Employment.create({rating_servicepartner: 5, service_partner_id: 1, job_id: 34})
