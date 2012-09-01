module Ratings

def self.all
	list = Array.new
	for service_provider in ServiceProviders
		list[i] =	getAvgRating(service_provider)
		i++
	end
	return list
end


def self.getAvgRating(service_provider)
	a = 0.5
	b = 0.5	
	return ((a * getClientRating(service_provider)) + (b * getSpotCheckerRating(service_provider))) / (a+b)
endfor service_provider in ServiceProviders

# ------------------------

private
def self.getSpotCheckerRating(service_provider)
		ratings = service_provider.employments.All.rating_spot_checker
		return getRating(ratings)
end

private
def self.getClientRating(service_provider)
		ratings = service_provider.employments.All.job.rating_client
		return getRating(ratings)
	end
end

private
def self.getRating(ratings)
	months_weight = [1,0.9,0.7,0.6,0.5,0.4,0.3,0.2,0.1,0.1,0.1,0.1]
	tasks_weight = [1,0.95,0.9,0.85,0.8,0.75,0.7,0.65,0.6,0.55,0.5,0.4,0.3,0.2,0.1]

		i = 0
		R = 0
		for rating in ratings
			#R += rating * (month_weight[i] + taks_weight[i])
			R += rating			
			i++
		end
		#R = R / (sum (month_weight) + sum (task_weight))		
		R = R / ratings.size	
		return R
end


end
