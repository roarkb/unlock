#!/usr/bin/env ruby

def bi_to_combo(bi)
  combo = []
  
  bi_a = ("%b" % bi).chars.to_a
  
  (10 - bi_a.length).times do
    bi_a.unshift(0)
  end
  
  bi_a.each_with_index do |bool,ind|
    combo.push(ind) if bool.to_i == 1
  end
  
  return combo.to_s
end

combo_list = []

(0b0..0b1111111111).each do |bi|
  combo_list.push(bi_to_combo(bi))
end

combo_list.sort
last_combo = combo_list.pop

combo_list.each { |combo| print "#{combo}UR" }
print "#{last_combo}U"
