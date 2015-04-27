class Array
	def compress
		result = []
		self.each do |el|
			el.each do |val|
				unless val.nil?
					result << [el, val]
				end
			end 
		end
	end
end