def majeur(age):
    if age < 0 or age >= 120:
        return "menteur"
    elif age == 18:
        return "à peine majeur"
    elif age > 18:
        return "majeur"
    else:
        return "mineur"