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
