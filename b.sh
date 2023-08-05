#!/bin/bash

#B. Script b.ext que implementa un
#sistema de filtrado o de transformación sobre los datos haciendo uso de
#expresiones regulares complejas. Es necesario definir un objetivo en el
#filtro o en la transformación.

#El script tiene un mínimo de 7 líneas que hagan transformaciones
#con los datos, es decir, sentencias que modifiquen los datos o generen una
#estructura nueva a partir de expresiones regulares, grep, sed, etc. No se
#computarán como líneas efectivas de código aquellas sentencias que no
#manipulen los datos. Por ejemplo, no se computarán sentencias básicas
#para visualizar información (echo, print, cat, etc.), comentarios en el
#código, asignaciones, construcción de estructuras (if, for, while, fi,
#do, done, etc.), etcétera.

sed "{

#Eliminación de coma dentro de cada registro, de no hacerlo la estructura del dataset
#no será igual en todas sus filas.
s/, / /g

#Eliminación de dobles comillas dentro de los registros
s/\"//g

#Sustitución de palabras con una coma dentro de su propio nombre
s/20,000 Leagues Under the Sea/20.000 Leagues Under the Sea/
s/Alexander and the Terrible Horrible,…/Alexander and the Terrible Horrible …/

# Eliminar Filas con valores no deseados
/.*,.*,.*,.*,0,0/d

#Añadir Not Rated a las filas que no contengan información de la columna mpaa_rating
s/\(.*,.*,.*,\)\(,\)\(.*,.*\)/\1Not Rated,\3/

#Añadir Other a las filas que no contengan información en la columna genre
s/\(.*,.*,\)\(,\)\(.*,.*,.*\)/\1Other,\3/

#(Opciones alternativas)
#_______________________

#Eliminar si no quisiéramos las filas que no tienen genero
#/.*,.*,,.*,.*,.*/d

#Eliminar la cuarta columna
#s/\(.*,.*,.*,\)\(.*,\)\(.*,.*\)/\1\3/

}" ./disney_movies.csv > ./disney.csv

rm ./disney_movies.csv
