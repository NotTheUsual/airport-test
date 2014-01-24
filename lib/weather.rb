module Weather

	def check_weather
		random_stormy_day? ? :stormy : :sunny
	end

	def has_inclement_weather?
		check_weather == :stormy
	end

	def random_stormy_day?
		rand(10) == 7
	end
end

