class SimpleCalculator
  class ZeroDivisionError < StandardError; end
  class UnsupportedOperation < StandardError; end

  ALLOWED_OPERATIONS = %w[+ / *].freeze

  def self.calculate(first_operand, second_operand, operation)
    raise ArgumentError, 'Operands must be integers' unless first_operand.is_a?(Integer) && second_operand.is_a?(Integer)
    raise UnsupportedOperation, 'Operation not allowed' unless ALLOWED_OPERATIONS.include?(operation)

    return "Division by zero is not allowed." if operation == '/' && second_operand.zero?

    result =
      case operation
      when '+' then first_operand + second_operand
      when '*' then first_operand * second_operand
      when '/' then first_operand / second_operand
      end

    "#{first_operand} #{operation} #{second_operand} = #{result}"
  end
end