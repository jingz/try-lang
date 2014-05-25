require "prime"
(0..40).to_a.each do |n|
  puts n unless Prime.prime?(n**2 + n + 41)
end

# prove 40 can not get prime
