class Microwave

  def initialize(input)
    @input = input
  end

  def timer
    minutes = @input / 100    
    seconds = @input % 100

    minutes += seconds / 60
    seconds = seconds % 60

    "#{minutes.to_s.rjust(2, '0')}:#{seconds.to_s.rjust(2, '0')}"
  end
end
