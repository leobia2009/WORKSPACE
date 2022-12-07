situacao_perna_papagaio = input()
lista_de_posicao = ['esquerda', 'direita', 'nenhuma', 'ambas']

while True: 
    try: 
        # TODO:  Programe aqui dentro as condições necessárias para satisfazer o problema
        # e imprima a saída de acordo com a situação das pernas do papagaio
        posicao_na_lista = lista_de_posicao.index(situacao_perna_papagaio)
        match int(posicao_na_lista):    
            case 0:
                print('ingles')
                break
            case 1:
                print('frances')
                break
            case 2:
                print('portugues')
                break
            case 3:
                print('caiu')
                break
            case other:
                break
    except EOFError: 
        break
    except ValueError:
        break