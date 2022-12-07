# DICAS SOBRE PYTHON:
# FUNÇÃO input(): Ela recebe como parâmetro uma String que será visível ao usuário, 
# onde geralmente informa que tipo de informação ele está esperando receber;
# FUNÇÃO print(): Ela é a responsável por imprimir os dados e informar os valores no terminal;
# MÉTODO split(): permite dividir o conteúdo da variável de acordo com as condições especificadas 
# em cada parâmetro da função ou com os valores predefinidos por padrão;

# Abaixo segue um exemplo de código que você pode ou não utilizar
valores = input().split() 

# TODO:  Calcule a média de cachorros quentes consumidas por participante e imprima o valor com DUAS casas decimais.

numero_de_cachorro_quente = int(valores[0])
numero_de_participantes = int(valores[1])

if ( (numero_de_cachorro_quente >= 1 and numero_de_participantes <= 10000) ):
    
    numero_medio_cachorro_quente = numero_de_cachorro_quente / numero_de_participantes
    numero_medio_cachorro_quente = round(numero_medio_cachorro_quente,2)
    print(f"{numero_medio_cachorro_quente:.2f}")