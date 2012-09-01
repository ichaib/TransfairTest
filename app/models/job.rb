class Job < ActiveRecord::Base
  attr_accessible :rating_client
	has_many :employments
end
