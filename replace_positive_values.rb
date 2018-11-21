values = [46, -24, 66, 87, -11, 89, -5, 90, 50, -16, -6, 89, -37, -21, -25]
min_value = values.min
values.map! { |value| value = value.positive? ? min_value : value }
puts values
