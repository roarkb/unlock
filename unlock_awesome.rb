#!/usr/bin/env ruby

# translate binary string onto lock combo
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

# get all possible unique combos
all_combos = []

(0b0..0b1111111111).each do |bi|
  all_combos.push(bi_to_combo(bi))
end

list = "UR"
tried = []

# sort combo list by length
all_combos = all_combos.sort_by { |x| x.length }.reverse
all_combos.slice!(-1)

all_combos.each do |combo|
#[ "0123456789", "012345789", "123456789" ].each do |combo|
  combo.chars.each do |char|
    list = list + char
    new = list.match(/[\dU]+$/).to_s.gsub("U", "")
    tried.push(new) unless tried.include?(new)
    list = list + "U"
  end

  list = list + "R"
end

print list
#p tried
#puts
#p list.length
#p tried.length
#p all_combos


#all_combos.sort_by {|x| x.length}.reverse.each do |combo|
