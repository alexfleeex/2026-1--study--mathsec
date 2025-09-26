function route_cipher_encrypt(text::String, password::String)

    text_clean = uppercase(filter(isletter, text))
    password_clean = uppercase(filter(isletter, password))
    
    n = length(password_clean)

    m = ceil(Int, length(text_clean) / n)

    if length(text_clean) < m * n
        text_clean *= "A"^(m * n - length(text_clean))
    end
   
    matrix = reshape(collect(text_clean), (n, m))
    
    order = sortperm(collect(password_clean))

   
    cipher = ""
    for col in order
        cipher *= String(matrix[col, :])
    end
    
    return cipher
end


function route_cipher_decrypt(cipher::String, password::String)
    password_clean = uppercase(filter(isletter, password))

    cipher = collect(cipher)

    n = length(password_clean)
    m = length(cipher) ÷ n
    
    order = sortperm(collect(password_clean))
    inv_order = invperm(order)

    matrix = fill(' ', m, n)
    pos = 1
    for col in order
        for row in 1:m
            matrix[row, col] = cipher[pos]
            pos += 1
        end
    end
    
    text = ""
    for row in 1:m
        text *= String(matrix[row, :])
    end
    
    return text
end

# text = "нельзя недооценивать противника"
# password = "пароль"

text = ARGS[1]
password = ARGS[2]

encrypted = route_cipher_encrypt(text, password)
println("Зашифрованный текст: ", encrypted, ".")

decrypted = route_cipher_decrypt(encrypted, password)
println("Расшифрованный текст: ", decrypted, ".")
