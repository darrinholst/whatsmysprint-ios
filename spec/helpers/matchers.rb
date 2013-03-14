def be_a(expected)
  lambda { |obj| obj.class == expected }
end

