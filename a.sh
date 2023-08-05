#!/bin/bash

#A. Script denominado a.sh que descarga el dataset, siempre que
#sea posible, y utilizando las herramientas vistas durante el curso muestre:
#○ La URL de descarga del dataset.
#○ Formato del o de los ficheros que lo componen.
#○ Número de columnas y registros.
#○ Tipo de datos (entero, decimal, fecha, texto, etc).
#El script debe, al menos, contemplar una opción / argumento de línea de
#comandos.

if [ -f ./disney_movies.csv ];
then
echo "El archivo disney_movies.csv existe, no es necesario descargarlo de nuevo."
echo " "
else
git clone https://github.com/sibeltan/disney_movies_analysis.git
mv ./disney_movies_analysis/data/disney_movies.csv ./
sudo rm -r ./disney_movies_analysis
echo " "
fi
echo "La Url de descarga del archivo es:"
echo "https://github.com/sibeltan/disney_movies_analysis.git"

echo " "

echo "El número de columnas que lo componen es:"
awk -F, 'NR==1{print NF}' ./disney_movies.csv

# Otra posible opción
#head -1 ./disney_movies.csv | sed 's/[^,]//g' | wc -c

echo " "

echo "El número de registros que lo componen es:"
wc -l ./disney_movies.csv | awk '{print $1}'

echo " "

while true;
do
	case $1 in
	-v)	echo "El formato del ficheo es:"
                file -ib ./disney_movies.csv
		echo " "
		echo "Las columnas y sus tipos son:"
		sed -rn '1p
                2s/([a-zA-Z]+-*\s*)+/(texto)/g
                2s/([[:digit:]]+-[[:digit:]]+-[[:digit:]]+)/(fecha)/g
                2s/([[:digit:]]+\.[[:digit:]]+)/(decimal)/g
                2s/([[:digit:]]+)/(entero)/gp' ./disney_movies.csv
		exit;;
		#Otra posible solución aunque menos correcta.
		#awk -F, 'NR==2{i=1;while(i <= NF-1){print $i,"es de tipo",typeof($i);i=i+1}}' ./disney_movies.csv;;
	esac
exit;
done

