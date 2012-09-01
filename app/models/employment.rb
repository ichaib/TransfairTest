class Employment < ActiveRecord::Base
  attr_accessible :job, :rating_servicepartner, :service_partner_id
	belongs_to :service_partner
	belongs_to :job
end
