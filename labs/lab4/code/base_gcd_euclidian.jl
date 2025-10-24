function gcd_euclidian(a::Integer, b::Integer)
	a = abs(a)
	b = abs(b)

	a, b = max(a, b), min(a, b)
	
	while b != 0
		a, b = b, a % b
	end

	return a

end

num1, num2 = 6, 3
println("НОД(", num1, ";", num2, ")=", gcd_euclidian(num1, num2))

num1, num2 = 3, 6
println("НОД(", num1, ";", num2, ")=", gcd_euclidian(num1, num2))

num1, num2 = 1, 3
println("НОД(", num1, ";", num2, ")=", gcd_euclidian(num1, num2))

num1, num2 = 3, 1
println("НОД(", num1, ";", num2, ")=", gcd_euclidian(num1, num2))

num1, num2 = 0, 10
println("НОД(", num1, ";", num2, ")=", gcd_euclidian(num1, num2))

num1, num2 = 10, 0
println("НОД(", num1, ";", num2, ")=", gcd_euclidian(num1, num2))
