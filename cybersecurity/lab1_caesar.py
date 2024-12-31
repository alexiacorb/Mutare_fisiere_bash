def decriptare_cezar(text_criptat, cheie):
    text_decriptat = ""
    for caracter in text_criptat:
        if caracter.isalpha():
            if caracter >= "a" and caracter <= "z":
                text_decriptat += chr((ord(caracter) - ord('a') - cheie) % 26 + ord('a'))
            else:
                text_decriptat += chr((ord(caracter) - ord('A') - cheie) % 26 + ord('A'))
        else:
            text_decriptat += caracter
    return text_decriptat

def gasire_siruri(text_criptat):
    for cheie in range(1, 26):
        text_decriptat = decriptare_cezar(text_criptat, cheie)
        print("Pentru cheia %d avem textul decriptat:\n%s\n" % (cheie, text_decriptat))

text_criptat = "Wi nwo jepah oe wyqi ie-wi wzqo wiejpa za wyaop rezak ienkxkhwjp dpplo://sss.ukqpqxa.yki/swpyd?r=JqjIbouO0ok ---- Zeopnwypea Ywpw,"
gasire_siruri(text_criptat)
