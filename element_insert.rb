# Fifth task
values = [46, -24, 66, 87, -11, 89, -5, 90, 50, -16, -6, -37, -21, -25]
i = 0
until i == values.count
	if values[i].positive?
		values.insert(i, values[0])
		i += 2
	else
		i += 1
	end
end
p values
