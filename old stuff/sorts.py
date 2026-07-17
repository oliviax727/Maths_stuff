import random
import math
import time

def bogosort():
    arr = randomize(populate(int(input('array size: '))))
    print('Starting Array: ' + str(arr) + '\n')

    count = 1
    start = time.time()

    while checkSorted(arr) != True:
        arr = randomize(arr)
        count += 1

        if count % (math.factorial(len(arr)) / 4) == 0:
            print('Attempt number: ' + str(count) + '\n')

    chance = math.factorial(len(arr))
    att = 100 * (chance-count)/chance
    
    print('Completed. Took ' + str(count) + ' attempt(s) and ' + str(round(time.time()-start, 2)) + 's.')
    print('This is ' + str(att) + '% better than chance.')

def randomize(lis):
    retli = []

    x = random.randint(0, len(lis)-1)
    while len(lis) > 1:
        retli.append(lis[x])
        lis.remove(lis[x])
        x = random.randint(0, len(lis)-1)
    
    retli.append(lis[0])

    return retli

def populate(size):
    li = []
    for c in range(size):
        li.append(c+1)
    
    return li

def checkSorted(lis):
    #print(lis)

    last = lis[0]
    for c in lis:
        if c >= last:
            last = c
        else:
            return False

    return True
