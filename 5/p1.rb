# frozen_string_literal: true
program = File.read('input.txt').split(',').map(&:to_i)

input = 1
current_pointer = 0

while current_pointer < program.size
  current_element = program[current_pointer]
  case current_element % 10
  when 9
    break
  when 1 # addition
    binary_current_element = current_element.to_s.to_i(2)
    value1 = (binary_current_element & 0b100).positive? ? program[1 + current_pointer] : program[program[1 + current_pointer]]
    value2 = (binary_current_element & 0b1000).positive? ? program[2 + current_pointer] : program[program[2 + current_pointer]]

    program[program[3 + current_pointer]] = value1 + value2
    current_pointer += 4
  when 2 # multiplication
    binary_current_element = (current_element - 1).to_s.to_i(2)
    value1 = (binary_current_element & 0b100).positive? ? program[1 + current_pointer] : program[program[1 + current_pointer]]
    value2 = (binary_current_element & 0b1000).positive? ? program[2 + current_pointer] : program[program[2 + current_pointer]]

    program[program[3 + current_pointer]] = value1 * value2
    current_pointer += 4
  when 3 # input
    program[program[1 + current_pointer]] = input
    current_pointer += 2
  when 4 # output
    output = program[program[1 + current_pointer]]
    p "check: #{output}"
    current_pointer += 2
  else
    raise
  end
end
