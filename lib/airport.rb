require 'weather'

class Airport
	include Weather

	attr_reader :capacity, :planes

	def initialize(capacity: 50)
		@capacity = capacity
		@planes = []
	end

	def land(plane)
		raise "This airport is currently full, sorry" if full?
		plane.land
		@planes << plane
	end

	def eject(plane)
		plane.fly
		@planes.delete(plane)
	end

	def full?
		current_number_of_planes == capacity
	end

	def current_number_of_planes
		@planes.length
	end
end