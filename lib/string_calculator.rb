class StringCalculator
  def self.add(numbers)
    return 0 if numbers.empty?

    delimiter = ","
    if numbers.start_with?("//")
      delimiter_line, numbers = numbers.split("\n", 2)
      delimiter = delimiter_line.gsub("//", "")
    end

    numbers.split(/#{delimiter}|\n/).map(&:to_i).inject(0) do |sum, num|
      if num.negative?
        raise "negative numbers not allowed: #{numbers.scan(/-[\d]+/).join(', ')}"
      else
        sum + num
      end
    end
  end
end
