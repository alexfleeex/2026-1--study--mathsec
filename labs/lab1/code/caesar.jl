function caesar_cipher(text::String, key::Int64; language::String="ru")
    
    if language == "ru"
        alphabet_upper = collect("АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ")
        alphabet_lower = collect("абвгдеёжзийклмнопрстуфхцчшщъыьэюя")
        alphabet_size = 33
	

    elseif language == "eng"
        alphabet_upper = collect("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        alphabet_lower = collect("abcdefghijklmnopqrstuvwxyz")
        alphabet_size = 26

    else
        println("NO NO NO, language must be 'ru' or 'eng'!")
	exit(1)
    end
    
    result = ""
    
    for char in text

        if char in alphabet_upper            
            index = findfirst(isequal(char), alphabet_upper) - 1
	    
            new_index = mod(index + key, alphabet_size)

            result *= alphabet_upper[new_index + 1]
        
	elseif char in alphabet_lower
            
            index = findfirst(isequal(char), alphabet_lower) - 1
            new_index = mod(index + key, alphabet_size)
            result *= alphabet_lower[new_index + 1]
        
	else
            
            result *= char
        end
    end
    
    return result
end

function encrypt(text::String, key::Int64; language::String="russian")
    return caesar_cipher(text, key, language=language)
end

function decrypt(text::String, key::Int64; language::String="russian")
    return caesar_cipher(text, -key, language=language)
end


message = ARGS[1]
key = parse(Int, ARGS[2])
lang = ARGS[3]

enc_message = encrypt(message, key, language=lang)

println("Зашифрованный текст: ", enc_message)

dec_message = decrypt(enc_message, key, language=lang)

println("Расшифрованный текст: ", dec_message)
