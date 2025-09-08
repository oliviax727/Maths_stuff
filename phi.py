def approximateGoldenRatio():
    n1 = float(input('Enter first number: '))
    n2 = float(input('Enter second number: '))
    iterations = int(input('How many iterations? '))
    c = 0

    while c < iterations:
        print(n2/n1)
        temp = n1 + n2
        n1 = n2
        n2 = temp
        c += 1