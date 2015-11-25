# Enter your procedural solution here!
def largest_prime_factor(input)

end

def factors(input)
  integer = 2
  factors = Array.new(1, 1)
  while integer <= input
    input % integer == 0 ? factors << integer : factors
    integer += 1
  end
  factors
end

def prime_factors(input)
  # factors(input).select {|factor| factor.prime?}
  factors = factors(input)
  factors.each do |factor|
    n = 2
    prime_factors = Array.new
    while n < factor
      factor % n != 0 ? prime_factors << factor : prime_factors
    end
  end
  print prime_factors
end

prime_factors(13195)
