from enum import IntEnum
import locale
locale.setlocale(locale.LC_ALL, ("pt.BR", ""))

class faixas_salariais(IntEnum):
    faixa1 = 0
    faixa2 = 1
    faixa3 = 2
    faixa4 = 3
    faixa5 = 4

salario = float(input())

if ( (salario >= 0.00) and (salario <= 600.00)):
    faixa_do_salario_do_funcionario = 0
elif ( (salario >= 601.00) and (salario <= 900.00)):
    faixa_do_salario_do_funcionario = 1
elif ( (salario >= 901.00) and (salario <= 1500.00)):
    faixa_do_salario_do_funcionario = 2
elif ( (salario >= 1501.00) and (salario <= 2000.00)):
    faixa_do_salario_do_funcionario = 3
elif ( (salario >= 2000.01)):
    faixa_do_salario_do_funcionario = 4
else:
    exit


# TODO:  Calcule o salário do funcionário e print o novo salário, bem como o valor de reajuste ganho e o índice reajustado (em porcentagem)

while True: 
    try: 
        match faixa_do_salario_do_funcionario:    
            case faixas_salariais.faixa1:
                percentual_para_aumento = 0.17
                break
            case faixas_salariais.faixa2:
                percentual_para_aumento = 0.13
                break
            case faixas_salariais.faixa3:
                percentual_para_aumento = 0.12
                break
            case faixas_salariais.faixa4:
                percentual_para_aumento = 0.10
                break
            case faixas_salariais.faixa5:
                percentual_para_aumento = 0.05
                break
            case other:
                break
    except EOFError: 
        break
    except ValueError:
        break
novo_salario_funcionario = (1 + percentual_para_aumento)*salario
aumento_do_salario = (percentual_para_aumento*salario)

print("Novo salario:{:.2f}".format(locale.format(novo_salario_funcionario)))
print("Reajuste ganho:{:.2f}".format(locale.format(aumento_do_salario)))
print("Em percentual:{:}%".format(locale.format(percentual_para_aumento*100)))5