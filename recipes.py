def parseText(file):
	f = open(file, "r")
	f1 = f.readLines()
	for line in f1:
		print(line)
		
def main():
	parseText("recipes.txt")