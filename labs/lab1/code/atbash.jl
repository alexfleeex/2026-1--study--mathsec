message = ARGS[1]
code = ARGS[2]

if code == "ru"
	alphabet = "АБВГДЕЁЖЗИЙКЛМНОПРСТУФХЦЧШЩЪЫЬЭЮЯ"
elseif code == "eng"
	alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
else
	println("!NO NO NO, language code must be 'ru' or 'eng'.")
	exit(1)
end

function atbash(msg, alp)
	
	reversed_alp = reverse(alp)
	
	result = ""

	for i in msg
                c = reversed_alp[findfirst(i, alp)]
                result = result * c
        end
        return result
end

encrypted_message = atbash(message, alphabet)
println("Зашифрованное сообщение: ", encrypted_message)

reversed_alphabet = reverse(alphabet)
decrypted_message = atbash(encrypted_message, reversed_alphabet)

println("Расшифрованное сообщение: ", decrypted_message)
