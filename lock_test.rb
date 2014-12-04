#!/usr/bin/env ruby

input = ARGF.read.chomp

# validate input
input.chars.each { |char| abort "\nyour input sucks!\n\n" unless char =~ /[\dUR]/ }

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

combo_list.sort.each do |answer|
combo = []
unlocked = 0

  input.chars.each do |char|  
    case char
    when "U"
      if combo.to_s == answer
        unlocked = 1
        break
      end
    when "R"
      combo.clear
    else
      combo.push(char)
    end
  end

  if unlocked == 1
    result = "success"
  else
    result = "failed"
  end

  puts "#{combo.to_s}: #{result}".rjust(19)
end
