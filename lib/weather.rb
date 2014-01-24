module Weather

	def check_weather
		random_stormy_day? ? :stormy : :sunny
	end

	def random_stormy_day?
		rand(10) == 7
	end
end

