program = File.read('input.txt').split(',').map(&:to_i)

current_pointer = 0

while current_pointer < program.size do
  case program[current_pointer]
  when 99
    break
  when 1
    program[program[3 + current_pointer]] = program[program[1 + current_pointer]] + program[program[2 + current_pointer]]
  when 2
    program[program[3 + current_pointer]] = program[program[1 + current_pointer]] * program[program[2 + current_pointer]]
  else
    raise
  end

  current_pointer += 4
end

p program
