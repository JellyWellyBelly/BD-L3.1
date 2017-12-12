# Made by: Grupo 13 BD IST 2017/2018
# The schema that this generator abids is specific to our project.
# In order to get the populate file just run this script and 
#     substitute the constant nr_prod for a higher number to 
#     add more products to the DB

from random import random
from math import floor

nr_prod = 100000			# For a good populate experience, must be bigger than this
nr_suppliers = 1000
allUseStr = ''
categoryDict = {		# All of my 10 categories, it can be changed, but it doesn't improve much the test.
	0: 'Tuberculos',
	1: 'Frutos',
	2: 'Vegetal',
	3: 'Congelados',
	4: 'Gelo',
	5: 'Rissois',
	6: 'Gelados',
	7: 'Fruta',
	8: 'Legumes',
	9: 'Leguminosas',
}

with open('populate.sql', 'w') as popFile:

	# Inserting 'fornecedores'
	allUseStr = ''
	for insert in range(0, nr_suppliers):
		allUseStr += "INSERT INTO fornecedor VALUES (" + str(insert) + ", 'Fornecedor_" + str(insert) +  "');\n"
	popFile.write(allUseStr)


	# Inserting 'categorias' and 'categorias simples'
	allUseStr = ''
	for value in categoryDict.values():
		allUseStr += "INSERT INTO categoria VALUES ('" + value + "');\n"
	for value in categoryDict.values():
		allUseStr += "INSERT INTO categoria_simples VALUES ('" + value + "');\n"
	popFile.write(allUseStr)


	# Inserting 'produtos' (considerable amount)
	allUseStr = ''
	for i in range(0, nr_prod):
		ean = str(i)
		supplier = str(i % nr_suppliers)

		randomInt = floor(random()*10)
		category = categoryDict[randomInt]

		allUseStr += "INSERT INTO produto VALUES (" + ean + ", 'Description', '" + category + "', '" + supplier + "', DATE '2015-01-19');\n"
		if (i % nr_suppliers == nr_suppliers - 1) or (i == nr_prod - 1):
			popFile.write(allUseStr)
			allUseStr = ''

	# Inserting 'fornecedores secundarios' (a lot of them)
	allUseStr = ''
	for i in range(0, nr_prod * nr_suppliers):
		ean = str(i % nr_prod)
		nif = str(floor(random() * nr_suppliers))

		allUseStr += "INSERT INTO fornece_sec VALUES (" + nif + ", " + ean + ");\n"
		if (i % nr_suppliers == nr_suppliers - 1) or (i == nr_prod - 1):
			popFile.write(allUseStr)
			allUseStr = ''
