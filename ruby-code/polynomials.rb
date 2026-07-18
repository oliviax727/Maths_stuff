#!/usr/bin/ruby

class Polynomial
	# List of roots and coefficients
	attr_accessor :roots, :coefs
	
	# Create polynomial and solve
	def initialize(input = [], product_form = false)
		if product_form
			@roots = input
			@coefs = get_coefs(@roots)
		else
			@coefs = input
			@roots = get_roots(@coefs)
		end
	end
	
	# Get the roots from a list of coefficients
	def get_roots(coefs)
		return coefs
	end
	
	# Get the coefficients from a list of roots
	def get_coefs(roots)
		return roots
	end
	
	# Print as string
	def to_s(product_form = false)
		outstr = ""
		
		if product_form
			@roots.each { |root| outstr += "(x" + print_neg(root) + ")" }
		else
			(@coefs.size - 1).downto(0) do |i|
				coef = @coefs[i]
				outstr += (i == @coefs.size - 1 ? coef.to_s : print_neg(coef)) + (i > 0 ? "x^" + i.to_s : "")
			end
		end
		
		return outstr
	end
	
	def print_neg(n)
		return(n > 0 ? "+" + n.to_s : (n < 0 ? "-" + n.to_s : ""))
	end
end


# A valid irreducible polynomial
VALID_POLYNOMIAL = /x\^?/x

# A valid polynomial number
VALID_P = /#{VALID_POLYNOMIAL}:[0-9]+/

# The polynomial root class defines a single number that is the solution to a polynomial
class P
	attr_accessor :poly, :rootn
end

if __FILE__ == $0
	puts "Hello World!"
	poly = Polynomial.new([3, 4, 5])
	puts poly.to_s(true)
end
