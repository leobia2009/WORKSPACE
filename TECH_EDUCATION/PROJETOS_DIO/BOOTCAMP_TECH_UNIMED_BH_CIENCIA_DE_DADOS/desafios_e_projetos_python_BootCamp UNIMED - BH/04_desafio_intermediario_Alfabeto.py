import string

def listAlphabet():
  return [chr(i) for i in range(ord('A'),ord('Z')+1)]

letra = input()
pos = 1
if (letra >= 'A' and letra <= 'Z'):
    lista = listAlphabet()
    pos += lista.index(letra)

print(pos)
