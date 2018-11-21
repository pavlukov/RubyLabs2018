# Seventh task
string = "Hello my name is Sergey"
arr = string.split
string = arr.sort_by { |word| word.length }.join(" ")
puts string
