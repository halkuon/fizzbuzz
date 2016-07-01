require 'rails_helper'
require_relative '../../lib/fizz_buzz.rb'

describe FizzBuzz do
  describe '#divisible_by_15?' do
    it 'determines if a given value is divisible by 15' do
      divisible = FizzBuzz.divisible_by_15?(15)
      expect(divisible).to be(true)
      divisible = FizzBuzz.divisible_by_15?(13)
      expect(divisible).to be(false)
    end
  end

  describe '#divisible_by_5?' do
    it 'determines if a given value is divisible by 5' do
      divisible = FizzBuzz.divisible_by_5?(5)
      expect(divisible).to be(true)
      divisible = FizzBuzz.divisible_by_5?(3)
      expect(divisible).to be(false)
    end
  end

  describe '#divisible_by_3?' do
    it 'determines if a given value is divisible by 3' do
      divisible = FizzBuzz.divisible_by_3?(3)
      expect(divisible).to be(true)
      divisible = FizzBuzz.divisible_by_3?(5)
      expect(divisible).to be(false)
    end
  end

  describe '#check_value' do
    it 'determines the correct response when passed in various values' do
      fizz_buzz_list = (1..50).map { |x| FizzBuzz.check_value(x) }
      expect(fizz_buzz_list.select { |x| x.eql?('FizzBuzz') }.count).to eq(3)
      expect(fizz_buzz_list.select { |x| x.eql?('Fizz') }.count).to eq(13)
      expect(fizz_buzz_list.select { |x| x.eql?('Buzz') }.count).to eq(7)
    end
  end
end
