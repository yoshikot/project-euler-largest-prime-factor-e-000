# Enter your object-oriented solution here!
class LargestPrimeFactor

  def initialize(input)
    @input = input
  end

  def factors
    integer = 2
    first_half_factors = []
    while integer <= @input ** 0.5
      @input % integer == 0 ? first_half_factors << integer : first_half_factors
      integer += 1
    end
    second_half_factors = []
    first_half_factors.each do |factor|
      second_half_factors << @input / factor
    end
    factors = first_half_factors + second_half_factors
    factors = factors.sort; factors = factors.uniq
  end

  def non_prime_factors
    @factors = factors
    non_prime_factors = []
    check = 1
    while check < @factors.length
      cycle = 0
      while cycle < check
        if @factors[check] % @factors[cycle] == 0
          non_prime_factors << @factors[check]
        end
        cycle += 1
      end
      check += 1
    end
    non_prime_factors = non_prime_factors.uniq
  end

  def prime_factors
    @non_prime_factors = non_prime_factors
    prime_factors = @factors - @non_prime_factors
  end

  def number
    prime_factors.max 
  end

end

print LargestPrimeFactor.new(50).number