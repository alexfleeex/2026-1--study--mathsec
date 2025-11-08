function jacobi_symbol(a::Integer, n::Integer)
    a == 0 && return 0
    a == 1 && return 1
    
    g = 1
    local_a = a % n
    
    while local_a ≠ 0

        k = 0
        while iseven(local_a)
            local_a ÷= 2
            k += 1
        end
        

        if isodd(k)
            n_mod8 = n % 8
            if n_mod8 == 3 || n_mod8 == 5
                g = -g
            end
        end
        

        if (n % 4 == 3) && (local_a % 4 == 3)
            g = -g
        end
        

        local_a, n = n % local_a, local_a
    end
    
    return n == 1 ? g : 0
end


function solovay_strassen_test(n::Integer, k::Integer=10)
    n ≤ 3 && return n == 2 || n == 3
    iseven(n) && return false
    
    for _ in 1:k
        a = rand(2:(n-2))
        
        if gcd(a, n) > 1
            return false
        end
        

        r = powermod(a, (n-1)÷2, n)
        
        if r ≠ 1 && r ≠ n-1
            return false
        end
        

        s = jacobi_symbol(a, n)
        

        s_mod_n = s ≥ 0 ? s : s + n
        
        if r ≠ s_mod_n
            return false
        end
    end
    return true
end


#########################
num = 11
if solovay_strassen_test(num) == true
	result = "простое"
else
	result = "составное"
end
println("Число ", num, " - ", result)

############################
num = 228
if solovay_strassen_test(num) == true
	result = "простое"
else
	result = "составное"
end
println("Число ", num, " - ", result)
############################
