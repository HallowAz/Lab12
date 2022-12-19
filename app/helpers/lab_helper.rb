# frozen_string_literal: true

module LabHelper
    # This method smells of :reek:DuplicateMethodCall%>
    def self.palin(number)
      sum = (number[number.length - 1].to_s.to_i + number[number.length - 1].to_s.reverse.to_i).to_s
      number << sum
      if number.length == 1000
        number
      elsif sum == sum.reverse
        number
      else
        palin(number)
      end
    end
  end
  