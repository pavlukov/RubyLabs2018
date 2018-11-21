# Fourth task
values = [1, 2, 3, 4, 5, 6, 7, 8, 9]
number_of_shifts = 3
number_of_shifts.times do values.push(values.shift) end
p values
