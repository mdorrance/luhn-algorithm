require 'minitest'
require 'minitest/autorun'
require './luhn'

class LuhnTest < Minitest::Test

	def setup
		@luhn = Luhn.new("4929735477250543")
	end

	def test_reverses_string_and_changes_to_integer
		result = @luhn.reversed_card
		assert_equal [3, 4, 5, 0, 5, 2, 7, 7, 4, 5, 3, 7, 9, 2, 9, 4], result
	end

	def test_double_every_other_one
		result = @luhn.double_every_other_one
		assert_equal [3, 8, 5, 0, 5, 4, 7, 14, 4, 10, 3, 14, 9, 4, 9, 8], result
	end

	def test_for_length_of_2
		result = @luhn.adding_length_of_two
		assert_equal [3, 8, 5, 0, 5, 4, 7, 5, 4, 1, 3, 5, 9, 4, 9, 8], result
	end

	def test_sum_all_numbers
		result = @luhn.sum_all_numbers
		assert_equal 80, result
	end

	def test_validity
		result = @luhn.check_validity?
		assert result
	end

end
