class Plane
	attr_reader :status
	
	def initialize
		fly
	end

	def land
		@status = :landed
	end

	def fly
		@status = :flying
	end
end