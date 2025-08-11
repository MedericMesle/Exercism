class Luhn

  def self.valid?(number_string)
    return false unless number_string.is_a?(String)

    compact = number_string.delete(' ')
    return false if compact.length <= 1
    return false unless compact.match?(/\A\d+\z/)

    sum = compact
            .reverse
            .chars
            .map(&:to_i)
            .each_with_index
            .sum do |digit, idx_from_right|
              if idx_from_right.odd?
                doubled = digit * 2
                doubled > 9 ? doubled - 9 : doubled
              else
                digit
              end
            end

    (sum % 10).zero?
  end
end
