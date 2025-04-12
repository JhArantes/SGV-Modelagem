


# Estilização Terminal
def style():
    print('===========================================')


# Nota cliente

# Output Nota

# IF para cada nota

style()
print('Bem vindo ao SAC!!')
style()

while True:
    nota = int(input('Nota do Atendimento: '))
    satisfacao = ''
    melhoria_user = ''

    if 0 < nota > 10:
        print('Valor invalido! Nota de 0 a 10')
        continue
    
    if nota < 4:
        satisfacao = 'Baixa'

    if 4 >= nota or nota <= 7:
        satisfacao = 'Media'
    
    if nota > 7:
        satisfacao = 'Alta'
    

    style()
    print(f'Sua nota foi {satisfacao}!!')
    melhoria_user = input('Como podemos melhorar? ')
    style()

    print(f'Okay vamos melhorar no aspecto {melhoria_user}')
    style()
    break
    


    







