# FizzBuzz class where standard rules apply
class FizzBuzz
  def self.check_value(value)
    return 'FizzBuzz' if divisible_by_15?(value)
    return 'Buzz' if divisible_by_5?(value)
    return 'Fizz' if divisible_by_3?(value)
  end

  def self.divisible_by_15?(value)
    value % 15 == 0
  end

  def self.divisible_by_5?(value)
    value % 5 == 0
  end

  def self.divisible_by_3?(value)
    value % 3 == 0
  end
end
