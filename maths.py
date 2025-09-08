import primes
import phi
import sorts
import base

print('\nWelcome to some maths programming stuff. Enter "list" to see the available actions. Enter "exit" to quit program.')

com = input('\nEnter a command: ')
print('')
while com != 'exit':

    if com == 'list':
        listOfStuff = ['primes', 'phi', 'bogosort', 'base']
        print('Here are all of the current models:')

        for c in listOfStuff:
            print(c)

    elif com == 'primes':
        primes.listPrimes()

    elif com == 'phi':
        phi.approximateGoldenRatio()

    elif com == 'bogosort':
        sorts.bogosort()

    elif com == 'base':
        base.convertBase()

    com = input('\nEnter a command: ')
    print('')
