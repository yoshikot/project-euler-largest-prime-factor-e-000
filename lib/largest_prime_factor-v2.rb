# Works alright for 13195 but takes too long for 600851475143

# Enter your procedural solution here!
def largest_prime_factor(input)
  prime_factors(input).max
end

def factors(input)
  integer = 2
  factors = Array.new(1, 1)
  while integer <= input
    input % integer == 0 ? factors << integer : factors
    integer += 1
  end
  factors.pop; factors.shift
  factors
end

def non_prime_factors(input)
  factors = factors(input)
  non_prime_factors = []
  check = 1
  while check < factors.length
    cycle = 0
    while cycle < check
      if factors[check] % factors [cycle] == 0
        non_prime_factors << factors[check]
      end
      cycle += 1
    end
    check += 1
  end
  non_prime_factors = non_prime_factors.uniq
end

def prime_factors(input)
  factors = factors(input)
  non_prime_factors = non_prime_factors(input)
  prime_factors = factors - non_prime_factors
end

# 13195 ^ 0.5 = 114.869
# 0, 1, 02, 03, 04, 05, 06, 007, 008, 009, 010, 0011, 0012, 0013
# 5, 7, 13, 29, 35, 65, 91, 145, 203, 377, 455, 1015, 1885, 2639
# 5, 7, 13, 29

# 0 x 15, 1 x 14, 2 x 13, 3 x 12, 4 x 11, 5 x 10, 6 x 9, 7 x 8
# is it true that i only need to go up to the sqrt of input?
# other than not being divisible by any other number, what are characteristics
# of prime numbers?

print "factors(13195) is #{factors(13195)}"
print "largest_prime_factor(13195) is #{largest_prime_factor(13195)}"
# print "factors(600851475143) is #{factors(600851475143)}"
# print "largest_prime_factor(600851475143) is #{largest_prime_factor(600851475143)}"
# print 13195.prime?  # this is not a real method
# print 3.prime?      # this is not a real method
