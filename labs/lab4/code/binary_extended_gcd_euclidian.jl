function is_even(a::Integer)
	return a % 2 == 0
end

function binary_extended_gcd_euclidian(a::Integer, b::Integer)

    a, b = abs(a), abs(b)
	if a == 0 return (b, 0, 1) end
	if b == 0 return (a, 1, 0) end


    a_orig, b_orig = a, b
    
    g = 1

    while is_even(a) && is_even(b)
        a ÷= 2
        b ÷= 2
        g *= 2
    end
    
    u, v = a, b
    A, B, C, D = 1, 0, 0, 1
    
    while u != 0
        
        while is_even(u)
            u ÷= 2
            
            if is_even(A) && is_even(B)
                A ÷= 2
                B ÷= 2
            else
                A = (A + b_orig) ÷ 2
                B = (B - a_orig) ÷ 2
            end
        end
        
        while is_even(v)
            v ÷= 2
            
            if is_even(C) && is_even(D)
                C ÷= 2
                D ÷= 2
            else
                C = (C + b_orig) ÷ 2
                D = (D - a_orig) ÷ 2
            end
        end
        
        if u >= v
            u = u - v
            A = A - C
            B = B - D
        else
            v = v - u
            C = C - A
            D = D - B
        end
    end
    
   
    d = g * v
    x, y = C, D

    return (d, x, y)
    
end

num1, num2 = 6, 4
g, x, y = binary_extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
# println(x, "*", num1, "+", y, "*", num2, "=", g)
println()

num1, num2 = 4, 6
g, x, y = binary_extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
# println(x, "*", num1, "+", y, "*", num2, "=", g)
println()

num1, num2 = 1, 3
g, x, y = binary_extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
# println(x, "*", num1, "+", y, "*", num2, "=", g)
println()

num1, num2 = 3, 1
g, x, y = binary_extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
# println(x, "*", num1, "+", y, "*", num2, "=", g)
println()

num1, num2 = 0, 10
g, x, y = binary_extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
# println(x, "*", num1, "+", y, "*", num2, "=", g)
println()

num1, num2 = 10, 0
g, x, y = binary_extended_gcd_euclidian(num1, num2)
println("НОД(", num1, ";", num2, ")=", g)
# println(x, "*", num1, "+", y, "*", num2, "=", g)
println()
