def main():
    ing2 = parseHash("recipes.txt")
    print(ing2)
def parseHash(file):
    f = open(file, 'r')
    recipes = {}
    titles = []
    ingredients = []
    for line in f.readlines():
        if(line[0] != '['):
            titles.append(line.strip('\n'))
        else:
            line = line.split(', ')
            newArr = []
            for x in line:
                x = x.replace('[', '')
                x = x.replace(']', '')
                newArr.append(x.strip('\n'))
            ingredients.append(newArr)
    for i in range(len(titles) -1 ):
        recipes[titles[i]] = ingredients[i]
    return recipes
main()

