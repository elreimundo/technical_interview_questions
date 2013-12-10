def sieve_primes_up_to(value)
	future_primes = (2..value).to_a
	future_primes.each do |prime|
	  future_primes.delete_if{|num| num % prime == 0 && num != prime}
	end
	future_primes
end

puts sieve_primes_up_to(100).inspect