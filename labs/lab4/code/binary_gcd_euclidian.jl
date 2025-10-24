function is_even(a::Integer)
	return a % 2 == 0
end

function binary_gcd_euclidian(a::Integer, b::Integer)
	a = abs(a)
	b = abs(b)

	if a == 0 return b end
	if b == 0 return a end
	
	g = 1

	while is_even(a) && is_even(b)
		a ÷= 2
		b ÷= 2
		g *= 2
	end

	u, v = a, b

	while u != 0

		while is_even(u)
			u ÷= 2
		end

		while is_even(v)
			v ÷= 2
		end

		if u >= v
			u = u - v
		else
			v = v - u
		end
	end

	return g * v
	
end

num1, num2 = 6, 4
println("НОД(", num1, ";", num2, ")=", binary_gcd_euclidian(num1, num2))

num1, num2 = 3, 6
println("НОД(", num1, ";", num2, ")=", binary_gcd_euclidian(num1, num2))

num1, num2 = 1, 3
println("НОД(", num1, ";", num2, ")=", binary_gcd_euclidian(num1, num2))

num1, num2 = 3, 1
println("НОД(", num1, ";", num2, ")=", binary_gcd_euclidian(num1, num2))

num1, num2 = 0, 10
println("НОД(", num1, ";", num2, ")=", binary_gcd_euclidian(num1, num2))

num1, num2 = 10, 0
println("НОД(", num1, ";", num2, ")=", binary_gcd_euclidian(num1, num2))
