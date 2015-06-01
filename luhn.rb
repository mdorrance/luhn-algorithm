class Luhn

	def initialize(card)
		@card = card
	end

	def reversed_card
		@card.reverse.chars.map(&:to_i)
	end

	def double_every_other_one
		 reversed_card.map.with_index do |number, index|
			if (index + 1) % 2 == 0
				(number * 2)				
			else 
				number				
			end		
		 end
	end

	def adding_length_of_two
		double_every_other_one.map do |number|
			if number.to_s.length == 2
				number - 9
			else
				number
			end
		end
	end

	def sum_all_numbers
		adding_length_of_two.reduce(0) do |sum, number|
			sum + number
		end
	end

	def check_validity?
		if sum_all_numbers % 10 == 0
			puts "Credit Card is valid."
			true
		else
			puts "Credit Card is FAKE."
			false
		end
	end

end


test1 = Luhn.new("4929735477250543")
test1.check_validity?
test2 = Luhn.new("5541801923795240")
test2.check_validity?
test3 = Luhn.new("5541808923795240")
test3.check_validity?
test4 = Luhn.new("4024007106512380")
test4.check_validity?
test5 = Luhn.new("6011797668867828")
test5.check_validity?
testamex = Luhn.new("342804633855673")
testamex.check_validity?

#take a number and starting from the right, take every other number and double it
#if the double is > 9 then split it and add the individual numbers
#then sum all the numbers and % 10 with remainder 0


# Your Luhn Algorithm Here

# Output
## If it is valid, print "The number is valid!"
## If it is invalid, print "The number is invalid!"