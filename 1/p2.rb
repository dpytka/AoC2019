def calc(fuel)
	return fuel if fuel / 3 - 2 <= 0

	new_fuel = fuel / 3 - 2

	fuel + calc(new_fuel)
end

p File.readlines('input.txt').map { |line| calc(line.to_i) - line.to_i }.sum
