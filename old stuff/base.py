import math

#Future Features:
# - Round numbers in bases
# - Introduce non-integer bases
# - Complex numbers???
def convertBase():
    num = input('Enter integer: ')
    bstart = int(input('Enter number base: '))
    bend = int(input('Enter final base: '))
    print('\n============================\n')

    if bend == bstart:
        print('No need for conversion.')
    else:
        if bstart != 10:
            num = convertToDecimal(num, bstart)
            print('Number in base 10: ' + str(num))

        if bend != 10:
            num = convertFromDecimal(num, bend)
            print('Number in base ' + str(bend) + ': ' + str(num))
        
        print('\nConverted.')

    

def convertToDecimal(n, b):
    out = 0
    index = len(n.split('.')[0]) - 1

    for c in n:
        if tryParseInt(c):
            out += int(c) * math.pow(b, index)
            index -= 1
        elif c != '.':
            out += (ord(c) - 55) * math.pow(b, index)
            index -= 1

    return round(out, 5)

def convertFromDecimal(n, b):
    out = ''
    n = float(n)
    index = -5

    #Find largest new-base index to start subtraction
    while n - math.pow(b, index) >= 0:
        index += 1
    
    index -= 1

    if index < 0 and n != 0:
        out += '0.'

        for c in range(1, - 1 * index):
            out += '0'

    print(n)
    #Continuously subtract lower indexes until n=0 or prescision limit
    while n != 0 and index >= -6:
        multis = []

        for c in range(0, b):
            #print('Test: ' + str(c))
            if n - (c * math.pow(b, index)) >= 0:
                multis.append(c)
            else:
                break
        
        #print(multis)
        n -= (multis[len(multis)-1]) * math.pow(b, index)

        if multis[len(multis)-1] >= 10:
            print(55 + multis[len(multis)-1])
            print(chr(55 + multis[len(multis)-1]))
            out += chr(55 + multis[len(multis)-1])
        else: 
            out += str(multis[len(multis)-1])

        if index == 0 and n != 0:
            out += '.'

        print(n)
        
        index -= 1

    #Add excess zeroes if needed 
    while index >= 0:
        out += '0'
        index -= 1
    
    #Round to 5 dp in base -- Later
    #if index == -7:
    #    ro = 0
    #    if ord(out[len(out)-1]) >= 65:
    #        ro = ord(out[len(out)-1]) - 55
    #    else:
    #        ro = out[len(out)-1]
    #    
    #    if b / ro >= 2 and ro -:
    #        if ord(out[len(out)-2]) >= 65:
    #            ord(out[len(out)-2]) = ro + 55
    #        else:
    #            ro = out[len(out)-1]

    return out


def tryParseInt(value):
    try:
        x = int(value)
        return True
    except ValueError:
        return False
