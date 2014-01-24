class Airport
	attr_reader :capacity

	def initialize(capacity: 50)
		@capacity = capacity
	end

	def land(plane)
		plane.land
	end

	def eject(plane)
		plane.fly
	end
end