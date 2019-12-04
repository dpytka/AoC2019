count = (136_818..685_979).select do |pass|
  chars = pass.to_s.chars.map(&:to_i)
  chars.each_cons(2).all? { |a, b| a <= b } && chars.each_cons(2).any? { |a, b| a == b }
end.size

p count
