using Random


function fermat_test(n::Integer, k::Integer=10)
    n ≤ 3 && return n == 2 || n == 3
    iseven(n) && return false
    
    for _ in 1:k
        a = rand(2:(n-2))
        if powermod(a, n-1, n) ≠ 1
            return false
        end
    end
    return true
end


function miller_rabin_test(n::Integer, k::Integer=10)
    n ≤ 3 && return n == 2 || n == 3
    iseven(n) && return false
    
    s = 0
    r = n - 1
    while iseven(r)
        r ÷= 2
        s += 1
    end
    
    for _ in 1:k
        a = rand(2:(n-2))
        
        y = powermod(a, r, n)
        
        if y ≠ 1 && y ≠ n-1
            j = 1
            while j ≤ s-1 && y ≠ n-1
                y = powermod(y, 2, n)
                if y == 1
                    return false
                end
                j += 1
            end
            
            if y ≠ n-1
                return false
            end
        end
    end
    return true
end

#########################
num = 11
if fermat_test(num) == true
	result = "простое"
else
	result = "составное"
end
println("Число ", num, " - ", result)

############################
num = 228
if fermat_test(num) == true
	result = "простое"
else
	result = "составное"
end
println("Число ", num, " - ", result)
############################
