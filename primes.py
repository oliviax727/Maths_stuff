def listPrimes():
    primes = []
    num = 2
    max = int(input('How many primes do you want displayed? '))
    count = 1

    while count <= max:
        prime = True
        for c in primes:
            if num % c == 0:
                prime = False
        if prime == True:
            count += 1
            primes.append(num)
            print(num)
        num += 1
    
    return primes
