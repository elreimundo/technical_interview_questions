NUMBER_WORDS = { 0 => "", 1 => "one",2 => "two", 3 => "three",
								 4 => "four", 5 => "five", 6 => "six",
								 7 => "seven", 8 => "eight", 9 => "nine",
								 10 => "ten", 11 => "eleven", 12 => "twelve",
								 13 => "thirteen", 14 => "fourteen", 15 => "fifteen",
								 16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
								 19 => "nineteen", 20 => "twenty", 30 => "thirty",
								 40 => "forty", 50 => "fifty", 60 => "sixty",
								 70 => "seventy", 80 => "eighty", 90 => "ninety"}

POWERS_OF_TEN = {12 => "trillion", 9 => "billion", 6 => "million", 
								 3 => "thousand", 2 => "hundred"}

def number_in_words(number)
	return NUMBER_WORDS[number] if NUMBER_WORDS.keys.include?(number)
  if number < 100
  	tens_place, ones_place = number.divmod(10)
  	number_in_words(tens_place * 10) + " " + number_in_words(ones_place)
  else
  	POWERS_OF_TEN.each do |power,word|
  	  leading_digits, trailing_digits = number.divmod(10**power)
  	  if leading_digits > 0
  	  	return number_in_words(leading_digits) + " " + word + " " + number_in_words(trailing_digits)
  	  end
  	end
  end
end

puts number_in_words(142112112)