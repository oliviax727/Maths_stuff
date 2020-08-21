import primes
import phi

print('\nWelcome to some maths programming stuff. Enter "list" to see the available actions. Enter "exit" to quit program.')

com = input('\nEnter a command: ')
print('')
while com != 'exit':

    if com == 'list':
        listOfStuff = ['primes', 'phi']
        print('Here are all of the current models:')

        for c in listOfStuff:
            print(c)

    elif com == 'primes':
        primes.listPrimes()

    elif com == 'phi':
        phi.approximateGoldenRatio()

    com = input('\nEnter a command: ')
    print('')