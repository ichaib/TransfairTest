class Rating
require LinearRegression

def self.all
	list = Array.new
	i = 0
	ServicePartner.all.each do |service_provider| 
		list[i] =	getAvgRating(service_provider)
		i += 1
	end
	list
end



def self.getAvgRating(service_provider)
	if (service_provider.employments.count > 0)
		a = 0.5
		b = 0.5	
		r = ((a * getClientRating(service_provider)) + (b * getSpotCheckerRating(service_provider))) / (a+b)
	else
		nil
	end
end

# ------------------------

private
def self.getSpotCheckerRating(service_provider)
		ratings = Array.new
		service_provider.employments.each do |employment|
			ratings << employment.rating_servicepartner
		end
		getRating(ratings)

end



def self.getClientRating(service_provider)
		ratings = Array.new
		if (service_provider.employments)
			service_provider.employments.each do |employment|
				ratings << employment.job.rating_client
			end
			getRating(ratings)
		end
end

def self.getRating(ratings)
	ratings = ratings.sort
	
		i = 0
		r = 0
		ratings.each do |rating|
			v = i * 0.9
			r += rating * v
			#r += rating		
			i = i + 1
		end
		#avg = r / (sum (month_weight) + sum (task_weight))		
		if (ratings.count != 0)
			avg = r.to_f / ratings.count
		else
			0
		end
end

def self.predict(x)
	weight = [1,0.95,0.9,0.85,0.8,0.75,0.7,0.65,0.6,0.55,0.5,0.4,0.3,0.2,0.1]
	reg = LinearRegression.new (weight)
	reg.predict(x)
end

def self.getRating2(ratings)
		ratings = ratings.sort
		i = 0
		r = 0
		ratings.each do |rating|
			weight = predict(i) 
			r += rating * weight
			sum_weight += weight
			i = i + 1
		end
		if (ratings.count != 0)
			avg = r.to_f / sum_weight
		else
			0
		end
end


end


