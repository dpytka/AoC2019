initial_memory = File.read('input.txt').split(',').map(&:to_i)

(0..99).to_a.product((0..99).to_a).each do |noun, verb|
  program = initial_memory.clone
  program[1] = noun
  program[2] = verb
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

  if program[0] == 19_690_720
    p "#{program[0]}: {#{noun}, #{verb}} => #{100 * noun + verb}"
    break
  end
end
