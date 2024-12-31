
def decriptare_vigenere(text_criptat, cheie):
    text_decriptat = ""
    poz = 0
    for litera in text_criptat:
        deplasare = ord(cheie[poz % len(cheie)].lower()) - ord('a') 
        if litera.isalpha():
            if litera.islower():
                text_decriptat += chr((ord(litera) - ord('a') - deplasare + 26) % 26 + ord('a'))
            else:
                text_decriptat += chr((ord(litera) - ord('A') - deplasare + 26) % 26 + ord('A'))
       	    poz+=1
        else:
            text_decriptat += litera
    return text_decriptat

print(decriptare_vigenere("ZUT", "RSA"))
print(decriptare_vigenere("ZUT(IKA_Sjercei)", "RSA"))
