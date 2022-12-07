# DICAS SOBRE PYTHON:
# FUNÇÃO input(): Ela recebe como parâmetro uma String que será visível ao usuário, 
# onde geralmente informa que tipo de informação ele está esperando receber;
# FUNÇÃO print(): Ela é a responsável por imprimir os dados e informar os valores no terminal;
# MÉTODO split(): permite dividir o conteúdo da variável de acordo com as condições especificadas 
# em cada parâmetro da função ou com os valores predefinidos por padrão;

# Abaixo segue um exemplo de código que você pode ou não utilizar

def truncate(num, n):
    integer = int(num * (10**n))/(10**n)
    return float(integer)

valores = input().split()

# declare constants

RENDIMENTO = 12 #RENDIMENTO EM km/L


# TODO:  Calcule quantidade de litros necessária para realizar a viagem e imprima com TRÊS dígitos após o ponto decimal

tempo_de_viagem = int(valores[0])
velocidade_media = int(valores[1])

distancia_percorrida = tempo_de_viagem * velocidade_media
combustivel_gasto = truncate( (distancia_percorrida / RENDIMENTO),3)
print(f"{combustivel_gasto:.3f}")
