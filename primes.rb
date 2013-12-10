def assert(truthiness)
	raise "tests failed" unless truthiness
end

@primes = [2,3]

def prime?(number)
	return false if number == 1
	@primes.each do |prime|
		if number % prime == 0 && number != prime
			return false
		end
	end
	true
end

def generate_primes_up_to(target)
	return @primes.select{|prime| prime <= target} if target <= @primes.last
	test_prime = @primes.last + 2
	while test_prime <= target
		@primes.push(test_prime) if prime?(test_prime)
		test_prime += 2
	end
	@primes
end

assert(prime?(0)==false)
assert(prime?(1)==false)
assert(prime?(2))
assert(prime?(3))
assert(prime?(4) == false)
assert(prime?(5))
assert(generate_primes_up_to(1) == [])
assert(generate_primes_up_to(2) == [2])
assert(generate_primes_up_to(3) == [2,3])
assert(generate_primes_up_to(5) == [2,3,5])
puts generate_primes_up_to(100).inspect
assert(prime?(35) == false)
assert(prime?(97))

puts "All tests pass!"