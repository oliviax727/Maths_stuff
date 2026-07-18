#!/usr/bin/ruby

def clear_whitespace
	# Clears all \s in a string with nothing
end

# Natural number class
class N
	attr_accessor :value
end

# Any number containing digits from 0 to 9 is a valid decimal natural number
VALID_N = /[0-9]+/x

class Z
	attr_accessor :value
end

# Any valid natural number with an optional preceeding minus sign is a valid integer
VALID_Z = /-?#{VALID_N}/x

class Q
	attr_accessor :value
end

# Any valid integer followed by a slash and an optional divisor is a valid rational
VALID_Q = /#{VALID_Z}\/(#{VALID_N})?/x

class R
	attr_accessor :value
end

# Any valid integeger followed by a dot and an optional natural number expansion (either no
# recursion, partial recursion, or full recursion) is a valid real number
VALID_R = /(#{VALID_Z})?\.(#{VALID_N})?(\(#{VALID_N}\))?/x

class C
	attr_accessor :real, :imag, :real_type, :imag_type
end

# Combine all four real-valued classes into one
VALID_REAL = /#{VALID_N}|#{VALID_Z}|#{VALID_Q}|#{VALID_R}/x

# Any two valid numbers from the N, Z, Q, and R classes with either entry including an i or j
# is a valid complex number. Also define a valid imaginary component.
# VALID_C accepts complex numbers of the form a+bi, ai+b, and ai
VALID_iR = /#{VALID_REAL}(i|j)/x
VALID_C = /(#{VALID_REAL}(+|(?=-))#{VALID_iR})|(#{VALID_iR}(+|(?=-))#{VALID_REAL})|(#{VALID_iR})/x

# Combine everything
VALID_COMPLEX =/#{VALID_C}|#{VALID_REAL}/x

if __FILE__ == $0
	puts VALID_Z
	puts VALID_N
end