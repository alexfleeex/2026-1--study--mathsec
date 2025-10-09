function encrypt(text::String, key::String)::Vector{UInt8}
    text_bytes = Vector{UInt8}(text)
    key_bytes = Vector{UInt8}(key)
    
    encrypted = Vector{UInt8}()
    key_len = length(key_bytes)
    
    for i in 1:length(text_bytes)

        key_byte = key_bytes[(i - 1) % key_len + 1]
        encrypted_byte = text_bytes[i] ⊻ key_byte
        push!(encrypted, encrypted_byte)
    end
    
    return encrypted
end

function decrypt(encrypted_bytes::Vector{UInt8}, key::String)::String
    key_bytes = Vector{UInt8}(key)
    decrypted = Vector{UInt8}()
    key_len = length(key_bytes)
    
    for i in 1:length(encrypted_bytes)
        key_byte = key_bytes[(i - 1) % key_len + 1]
        decrypted_byte = encrypted_bytes[i] ⊻ key_byte
        push!(decrypted, decrypted_byte)
    end
    
    return String(decrypted)
end


text = ARGS[1]
key = ARGS[2]

println("Сообщение: ", text)
println("Ключ: ", key)

encrypted = encrypt(text, key)

println("Шифротекст: ", join([string(b, base=16, pad=2) for b in encrypted], " "))

decrypted = decrypt(encrypted, key)

println("Расшифрованный текст: ", decrypted)
