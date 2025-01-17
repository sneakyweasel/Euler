#Pentagonal numbers are generated by the formula, Pn=n(3n1)/2. The first ten pentagonal numbers are:
#1, 5, 12, 22, 35, 51, 70, 92, 117, 145, ...
#It can be seen that P4 + P7 = 22 + 70 = 92 = P8. However, their difference, 70 - 22 = 48, is not pentagonal.
#Find the pair of pentagonal numbers, Pj and Pk, for which their sum and difference is pentagonal and D = |Pk  Pj| is minimised; what is the value of D?

require "mathn"
class Integer
	def pentagonal
		self * (3 * self - 1) / 2
	end
	def is_pentagonal?
		((Math.sqrt(24*self + 1) + 1) / 6) % 1 == 0 ? true : false
	end
end

solution = []
catch :done do
	(1..10000).each do |k|
		(1..10000).each do |j|
			if (k.pentagonal + j.pentagonal).is_pentagonal? && (k.pentagonal - j.pentagonal).abs.is_pentagonal?
				puts "K:#{k.pentagonal} J:#{j.pentagonal} Sum:#{j.pentagonal + k.pentagonal} Diff:#{(j.pentagonal - k.pentagonal).abs}"
				throw :done
			end
		end
	end
end
