def assert(truthiness)
	raise "tests fail" unless truthiness
end

class FizzBuzz
	attr_reader :prime1, :prime2
	def initialize(prime1 = 3, prime2 = 5)
		@prime1 = prime1
		@prime2 = prime2
	end

	def fizzify(number)
		if number % (prime1 * prime2) == 0
			"FizzBuzz"
		elsif number % prime1 == 0
		 "Fizz"
		else
			number % prime2 == 0 ? "Buzz" : number
		end
	end
end

fizzbuzz = FizzBuzz.new(3,7)
assert(fizzbuzz.fizzify(1) == 1)
assert(fizzbuzz.fizzify(2) == 2)
assert(fizzbuzz.fizzify(3) == "Fizz")
assert(fizzbuzz.fizzify(7) == "Buzz")
assert(fizzbuzz.fizzify(42) == "FizzBuzz")

puts "Tests passed!"