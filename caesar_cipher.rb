def assert truthiness
	raise "tests failed" unless truthiness
end

def encode(letter,offset)
	if letter =~ /[A-Za-z]/
	  new_letter_number = letter.ord + offset
	  letter =~ /[A-Z]/ ? compare_to_letter('A',new_letter_number,offset) : compare_to_letter('a',new_letter_number,offset)
	else
		letter
	end
end

def encode_string(string,offset)
	string.split('').map{|letter| encode(letter,offset)}.join('')
end

def decode_string(string,offset)
	encode_string(string,-offset)
end

def compare_to_letter(letter,number,offset)
	((number - letter.ord) % 26 + letter.ord).chr
end

assert(encode("A",3) == "D")
assert(encode("A",4) == "E")
assert(encode("Z",4) == "D")
assert(encode("$",rand(150))=="$")
assert(encode_string("Don't Taze me, Bro!",26) == "Don't Taze me, Bro!")
puts encode_string("Don't Taze me, Bro!",5)
assert(decode_string(encode_string("sup, dawg!!",15),15)=="sup, dawg!!")

puts "Your tests are passing, you sly dog."