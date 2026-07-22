#!/usr/bin/ruby

def clear_whitespace()
	# Clears all \s in a string with nothing
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
			acc = _do.call(acc, vi)
		end
		return acc
	end
	
	def fold(init, _do)
		w = Array.new()
		acc = init
		@v.each_with_index do |i|
			acc = _do.call(acc, v[i])
			w[i] = acc
		end
		return Vector.new(w)
	end

	def map(_do)
		w = Array.new()
		@v.each_with_index do |i|
			w[i] = _do.call(v[i])
		end
		return Vector.new(w)
	end
	
	def zip(u, _do)
		w = Array.new()
		puts u.is_a? Vector
		if u.is_a? Vector
			@v.each_with_index do |i|
				w[i] = _do.call(@v[i], u.v[i])
			end
		else
			@v.each_with_index do |i|
				w[i] = _do.call(@v[i], u)
			end
		end
		return Vector.new(w)
	end
	
	# String conversion
	def to_s(); "[" + self.reduce("", lambda { |vi| return vi + ", " }) + "]"; end
	def from_s(str); eval str; end
	
	# Basic Arithmetic
	def +(u); return self.zip(u, lambda { |a, b| return a + b }); end
	def -(u); return self.zip(u, lambda { |a, b| return a - b }); end
	def *(u); return self.zip(u, lambda { |a, b| return a * b }); end
	def /(u)
		return self.zip(u, lambda { |a, b| return a / b })
	end
	
	# Extended Arithmetic
	def abs(); return self.map(lambda { |vi| return vi.abs }); end
	def %(m); return self.zip(u, lambda { |a, b| return a % b }); end
	def div(m); return self.zip(u, lambda { |a, b| return a.div(b) }); end
	def **(m); return self.zip(u, lambda { |a, b| return a ** b }); end
	
	# Complex Arithmetic
	def mag(); self.reduce(lambda { |vi| return vi ** 2 }) ** 0.5; end
	def arg()
		args = self.fold(self.mag, lambda { |acc, vi| return Math.atan2((acc ** 2 - vi ** 2) ** 0.5, vi) }).v
		return Vector.new(args[0, @v.length - 1])
	end
	def spherical(); return Vector.new([self.mag, *self.arg]); end
end

# Natural number class
class N < Integer
	# Any number containing digits from 0 to 9 is a valid decimal natural number
	VALID_N = /[0-9]+/x
end

# Integer class
class Z < Integer
	# Any valid natural number with an optional preceeding minus sign is a valid integer
	VALID_Z = /-?#{N::VALID_N}/x
end

# Rational number
class Q < Vector
	# Any valid integer followed by a slash and an optional divisor is a valid rational
	VALID_Q = /#{Z::VALID_Z}\/(#{N::VALID_N})?/x
end

# Real Number
class R < Vector
	# Any valid integeger followed by a dot and an optional natural number expansion (either no
	# recursion, partial recursion, or full recursion) is a valid real number
	VALID_R = /(#{Z::VALID_Z})?\.(#{N::VALID_N})?(\(#{N::VALID_N}\))?/x
	
	# Combine all four real-valued classes into one
	VALID_REAL = /#{N::VALID_N}|#{Z::VALID_Z}|#{Q::VALID_Q}|#{R::VALID_R}/x
	
	# Position at which reuccuring starts
	attr_accessor :rn
end


# Complex Number
class C < Vector
	# Any two valid numbers from the N, Z, Q, and R classes with either entry including an i or j
	# is a valid complex number. Also define a valid imaginary component.
	# VALID_C accepts complex numbers of the form a+bi, ai+b, and ai
	VALID_iR = /#{R::VALID_REAL}(i)/x
	VALID_C = /(#{R::VALID_REAL}(\+|(?=-))#{C::VALID_iR})|(#{C::VALID_iR}(\+|(?=-))#{R::VALID_REAL})|(#{C::VALID_iR})/x
	
	# Combine everything
	VALID_COMPLEX =/#{C::VALID_C}|#{R::VALID_REAL}/x
end

# Hypercomplex numbers
class Hypercomplex < Vector
	
end

if __FILE__ == $0
	test_scalar = Vector.new([3, 4])
	p test_scalar + 3
end