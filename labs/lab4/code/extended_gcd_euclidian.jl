function extended_gcd_euclidian(a::Integer, b::Integer)
	a, b = abs(a), abs(b)
	if a == 0 return (b, 0, 1) end
	if b == 0 return (a, 1, 0) end

		
	if a < b
		is_permuted = true
		a, b = b, a
	else
		is_permuted = false
	end

	r_prev, r_curr = a, b
	x_prev, x_curr = 1, 0
	y_prev, y_curr = 0, 1

	while r_curr != 0
		q = r_prev ÷ r_curr
		r_next = r_prev % r_curr

		x_next = x_prev - q * x_curr
		y_next = y_prev - q * y_curr

		r_prev, r_curr = r_curr, r_next
		x_prev, x_curr = x_curr, x_next
		y_prev, y_curr = y_curr, y_next
		
	end	

	if is_permuted
		return (r_prev, y_prev, x_prev)
	else
		return (r_prev, x_prev, y_prev)
	end
end

num1, num2 = 6, 4
g, x, y = extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
println(x, "*", num1, "+", y, "*", num2, "=", g)
println()

num1, num2 = 4, 6
g, x, y = extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
println(x, "*", num1, "+", y, "*", num2, "=", g)
println()

num1, num2 = 1, 3
g, x, y = extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
println(x, "*", num1, "+", y, "*", num2, "=", g)
println()

num1, num2 = 3, 1
g, x, y = extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
println(x, "*", num1, "+", y, "*", num2, "=", g)
println()

num1, num2 = 0, 10
g, x, y = extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
println(x, "*", num1, "+", y, "*", num2, "=", g)
println()

num1, num2 = 10, 0
g, x, y = extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
println(x, "*", num1, "+", y, "*", num2, "=", g)
println()
