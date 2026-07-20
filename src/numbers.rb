#!/usr/bin/ruby

def clear_whitespace()
	# Clears all \s in a string with nothing
end

# Abstract single-dimension object
class Scalar < Numeric
	# A basic real number value
	attr_accessor :n
	
	# Create the value
	def initialize(n)
		if n.is_a? String
			@n = Scalar.from_s(n)
		else
			@n = Integer(n)
		end
	end
	
	# String conversion
	def to_s(); @n.to_s; end
	def from_s(str); Scalar.new(eval str); end
	
	# Basic Arithmetic
	def +(m); Scalar.new(@n + m.n); end
	def -(m); Scalar.new(@n - m.n); end
	def *(m); Scalar.new(@n * m.n); end
	def /(m)
		Scalar.new(@n / m.n)
	end
	
	# Extended Arithmetic
	def abs(); Scalar.new(@n.abs); end
	def %(m); Scalar.new(@n % m.n); end
	def div(); Scalar.new(@n.div(m.n)); end
	def **(m); Scalar.new(@n ** m.n); end
	
	# Complex Arithmetic
	def mag(); Scalar.new(@n.abs); end
	def arg(); Scalar.new(@n.arg); end
	def conj(); self; end
	def sgn(); Scalar.new(@n.negative? ? -1 : 1); end
end

class Pair
	attr_accessor :x, :y
	
	# Create a pair
	def initialize(x, y = "")
		if x.is_a? Scalar and y.is_a? Scalar
			@x = x
			@y = y
		elsif x.is_a? String
			@x = Pair.from_s(x)
		end
	end
	
	# String conversion
	def to_s(); "(" + @x.to_s + ", " + @y.to_s + ")"; end
	def from_s(str); eval str; end
	
	# Basic Arithmetic
	def +(m); Pair.new(@n + m.n); end
	def -(m); Pair.new(@n - m.n); end
	def *(m); Pair.new(@n * m.n); end
	def /(m)
		Pair.new(@n / m.n)
	end
	
	# Extended Arithmetic
	def abs(); Pair.new(@n.abs); end
	def %(m); Pair.new(@n % m.n); end
	def div(); Pair.new(@n.div(m.n)); end
	def **(m); Pair.new(@n ** m.n); end
	
	# Complex Arithmetic
	def mag(); Pair.new(@n.abs); end
	def arg(); Pair.new(@n.arg); end
	def conj(); self; end
end

# Natural number class
class N < Scalar
	attr_accessor :value
	
	def to_s()
		return @value.to_s
	end
	
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
VALID_C = /(#{VALID_REAL}(\+|(?=-))#{VALID_iR})|(#{VALID_iR}(\+|(?=-))#{VALID_REAL})|(#{VALID_iR})/x

# Combine everything
VALID_COMPLEX =/#{VALID_C}|#{VALID_REAL}/x

if __FILE__ == $0
	puts VALID_Z
	puts VALID_N
	test_scalar = Scalar.new(3)
	p test_scalar
end