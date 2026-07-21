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
	def div(m); Scalar.new(@n.div(m.n)); end
	def **(m); Scalar.new(@n ** m.n); end
	
	# Complex Arithmetic
	def mag(); Scalar.new(@n.abs); end
	def arg(); Scalar.new(@n.arg); end
	def conj(); self; end
	def sgn(); Scalar.new(@n.negative? ? -1 : 1); end
end

class Vector < Numeric
	attr_accessor :v
	
	# Create a pair
	def initialize(v)
		if v.is_a? Array
			@v = v
		elsif v.is_a? String
			@v = Vector.from_s(v)
		end
	end
	
	# Looping methods
	def reduce(init, _do)
		acc = init
		for vi in @v do
			acc = _do(acc, vi)
		end
		return acc
	end
	
	def map(_do)
		w = Array.new()
		@v.each_with_index do |i|
			w[i] = _do(v[i])
		end
		return Vector.new(w)
	end
	
	def zip(u, _do)
		w = Array.new()
		if u.is_a? Vector
			@v.each_with_index do |i|
				w[i] = _do(@v[i], u.v[i])
			end
		else
			@v.each_with_index do |i|
				w[i] = _do(@v[i], u)
			end
		end
		return Vector.new(w)
	end
	
	# String conversion
	def to_s(); "[" + this.reduce("", lambda { |vi| return vi + ", " }) + "]"; end
	def from_s(str); eval str; end
	
	# Basic Arithmetic
	def +(u); this.zip(u, lambda { |a, b| return a + b }); end
	def -(u); this.zip(u, lambda { |a, b| return a - b }); end
	def *(u); this.zip(u, lambda { |a, b| return a * b }); end
	def /(u)
		this.zip(u, lambda { |a, b| return a / b })
	end
	
	# Extended Arithmetic
	def abs(); this.map(abs); end
	def %(m); this.zip(u, lambda { |a, b| return a % b }); end
	def div(m); this.zip(u, lambda { |a, b| return a.div(b) }); end
	def **(m); this.zip(u, lambda { |a, b| return a ** b }); end
	
	# Complex Arithmetic
	def mag(); this.reduce(lambda { |vi| return vi ** Scalar.new(2) }) ** Scalar.new(0.5); end
	def arg(); 8; end
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