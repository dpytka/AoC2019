count = (136_818..685_979).select do |pass|
  chars = pass.to_s.chars.map(&:to_i)

  prev = nil
  prev_val = 0
  arr = []
  chars.each do |el|
    if prev == el
      prev_val += 1
    else
      arr << prev_val if prev_val.positive?
      prev_val = 0
    end
    prev = el
  end
  arr << prev_val if prev_val.positive?

  chars.each_cons(2).all? { |a, b| a <= b } && arr.any?(1)
end

p count.size
