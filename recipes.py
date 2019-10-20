
def parseText(file):
    recipes = []
    ingredients = []
    f = open(file, "r")
    for line in f.readlines():
        if(line[0] != '['):
            recipes.append(line)
        else:
            ingredients.append(line.split(', '))
            print(ingredients)
        
                      
    return recipes, ingredients
def main():
    recipes = []
    ingredients = []
    recipes, ingredients = parseText("recipes.txt")
    print(len(ingredients))
    '''for i in range(len(ingredients)):
        print(ingredients[0])'''
    
main()
