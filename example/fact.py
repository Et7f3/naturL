def factorielle(n):
    total = 0
    for i in range(1, n + 1):
        total = i * total
    return total