#The nth term of the sequence of triangle numbers is given by, tn = ½n(n+1); so the first ten triangle numbers are:
#1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...
#By converting each letter in a word to a number corresponding to its alphabetical position and adding these values we form a word value. For example, the word value for SKY is 19 + 11 + 25 = 55 = t10. If the word value is a triangle number then we shall call the word a triangle word.
#Using words.txt (right click and 'Save Link/Target As...'), a 16K text file containing nearly two-thousand common English words, how many are triangle words?

tri = (1..1E2).map{|n| (0.5 * n) * ( n + 1) }
words_file = File.open('words.txt', 'r')
words = words_file.read.scan(/\w+/)
solution = []
words.each do |word|
	sum = word.each_byte.to_a.map{|n| n - 64}.reduce(:+)
	solution << word if tri.include?(sum)
end
puts solution.count