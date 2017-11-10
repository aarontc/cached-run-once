require 'test_helper'

class CachedRunOnceTest < Minitest::Test
	class SubjectA
		include CachedRunOnce


		def first_method
			@counter ||= 0
			@counter += 1
		end


		def second_method
			cached_run_once do
				@counter ||= 0
				@counter += 1
			end
		end
	end


	def test_that_it_has_a_version_number
		refute_nil ::CachedRunOnce::VERSION
	end


	def test_caching
		uut = SubjectA.new

		assert_equal 1, uut.first_method
		assert_equal 2, uut.first_method
		assert_equal 3, uut.second_method
		assert_equal 4, uut.first_method
		assert_equal 3, uut.second_method
		assert_equal 5, uut.first_method
	end
end
