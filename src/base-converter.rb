#!/usr/bin/ruby

# Smart convert a string into one of the many available number classes
def smart_convert(input = "")
	return 0
end

# Checks ONLY if the number is in decimal base NOT if it is valid
#VALID_DECIMAL =

# Any number containing digits from 0 to 9 is a valid decimal natural number
VALID_N = /[0-9]+/x

# A number of any base can either be
# - any string of standard word characters; OR
# - a list of decimal-base numbers encased in square brackets
VALID_NB = /([0-9a-zA-Z]+)|((\[#{VALID_N10}\])+)/x

# Combination of the two
# All higher-level classes don't care about the messy details of the base
VALID_N = /(#{VALID_NB})|(#{VALID_NX})/x