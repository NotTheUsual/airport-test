class Airport
	attr_reader :capacity, :planes

	def initialize(capacity: 50)
		@capacity = capacity
		@planes = []
	end

	def land(plane)
		plane.land
		@planes << plane
	end

	def eject(plane)
		plane.fly
		@planes.delete(plane)
	end
end