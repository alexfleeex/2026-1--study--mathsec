using Random

function pollard_rho(n, c=1, f=x -> x^2 + 1, max_iter=10000)
	if n==1
		return -1
	end

	if n % 2 == 0
		return 2
	end

	a = c
	b = c

	for i in 1:max_iter
		 a = f(a) % n
		 b = f(f(b) % n) % n

		 d = gcd(abs(a-b), n)

		 if 1 < d < n
		 	return d

		 elseif d == n
		 	return -1
		 end
	end

	return -1
end

function factorize(n)
	if n < 2
		return
	end

	result = pollard_rho(n)

	if result > 0
		return (result, n ÷ result)
	else
		return nothing
	end
end

function ferma_factorize(n)
	if n<=1
		return (-1, -1)
	end

	if n % 2 == 0
		return (2, n % 2)
	end

	s = isqrt(n)

	if s * s == n
		return (s, s)
	end

	s += 1 

	max_iter = 10000

	for i in 1:max_iter
		t2 = s * s - n

		t = isqrt(t2)
		if t * t == t2
			p = s - t
			q = s + t
			return (p, q)
		end

		s += 1
		if s > n
			break
		end
		
	end

	return (-1, -1)
	
end

for n in [15, 21, 35, 91, 1359331, 10403, 8051]
	res = factorize(n)
	println("Простое разложение: ", n, "=", res[1], "*", res[2])

	res = ferma_factorize(n)
	println("Разложение методом квадратов: ", n, "=", res[1], "*", res[2])

	println()
end
