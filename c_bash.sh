#!/bin/bash

#Sacar únicamente el año de la columna fecha.
while IFS=,
read col1 col2 col3 col4 col5 col6
do
	echo $col2 | sed 's/\(.*\)\(-.*-.*\)/\1/g' >> years.txt;
done < $1

#Cambiamos el nombre de la cabecera
sed -i 's/release_date/year/' years.txt

#Se unen la información en un unico fichero y se eliminan los ficheros.
paste disney.csv years.txt |sed 's/\t/,/' > disney_clean.csv
rm ./years.txt ./disney.csv

#Indicamos el número de columnas que dispone el csv
num=$(awk -F, 'NR==1{print NF}' ./disney_clean.csv)

#Dentro del bucle se va a recorrer todas columna y dentro de cada coincidencia se obtendrán los datos únicos
#y su cantidad de apariciones de esa respectiva columna.
#En las tres coincidencias que se van a llevar a cabo se realiza el siguiente proceso:
#1. Obtención de datos únicos y número de apariciones por separado.
#2. Creación de fichero para la cuenta añadiendo el nombre de la cabecera, esto permitirá de forma sencilla que
# los ficheros contengan el mismo número de registros.
#3. Se añaden el número de apariciones omitiendo la cabecera para evitar posibles fallos.
#4. De ser necesario se arreglan los pocos registros que contenían separaciones.
#5. Se unen para crear un único fichero que contiene toda la información que deseamos obtener de la columna.
#6. Eliminamos los ficheros que ya no vamos a necesitar.
for ((i=1;i<=$num; i++))
do
	if [[ $i -eq 3 ]];
	then
		#Columna Genero
		cut -d, -f$i ./disney_clean.csv | sort -g | uniq -c | sort | awk '{print $1}' >> c1_genre.txt
		cut -d, -f$i ./disney_clean.csv | sort -g | uniq -c | sort | awk '{print $2}' >> d_genre.txt
		echo "count_genre" >> c_genre.txt
                tail -n +2 ./c1_genre.txt >> ./c_genre.txt
		sed -i 's/genre/uniq_genre/' d_genre.txt
		sed -i 's/Black/Black Comedy/' d_genre.txt
		sed -i 's/Romantic/Romantic Comedy/' d_genre.txt
		paste ./d_genre.txt ./c_genre.txt |sed 's/\t/,/' > ./genero.csv
		rm ./c_genre.txt ./c1_genre.txt ./d_genre.txt
	elif [[ $i -eq 7 ]];
        then
                #Columna Years
                cut -d, -f$i ./disney_clean.csv | sort -g | uniq -c  | awk '{print $1}' >> c1_years.txt
                cut -d, -f$i ./disney_clean.csv | sort -g | uniq -c  | awk '{print $2}' >> d_years.txt
		echo "count_year" >> c_years.txt
		tail -n +2 ./c1_years.txt >> ./c_years.txt
		sed -i 's/year/uniq_year/' ./d_years.txt
		paste ./d_years.txt ./c_years.txt |sed 's/\t/,/' > ./anyos.csv
		rm ./c_years.txt ./c1_years.txt ./d_years.txt
        elif [[ $i -eq 4 ]];
        then
                #Columna Rating
                cut -d, -f$i ./disney_clean.csv | sort -g | uniq -c | sort | awk '{print $1}' >> c1_rating.txt
                cut -d, -f$i ./disney_clean.csv | sort -g | uniq -c | sort | awk '{print $2}' >> d_rating.txt
                echo "count_rating" >> c_rating.txt
                tail -n +2 ./c1_rating.txt >> ./c_rating.txt
		sed -i 's/mpaa_rating/uniq_rating/' ./d_rating.txt
		sed -i 's/Not/Not Rated/' ./d_rating.txt
		paste ./d_rating.txt ./c_rating.txt |sed 's/\t/,/' > ./clasificacion.csv
		rm ./c_rating.txt ./c1_rating.txt ./d_rating.txt
        fi
done

#Unimos los ficheros para obtener uno único
paste ./disney_clean.csv ./anyos.csv |sed 's/\t/,/' > ./1.csv
paste ./1.csv ./genero.csv |sed 's/\t/,/' > ./2.csv
paste ./2.csv ./clasificacion.csv |sed 's/\t/,/' > ./disney_clean.csv

#Eliminamos los ficheros que ya no vamos a necesitar
rm ./clasificacion.csv ./genero.csv ./anyos.csv ./1.csv ./2.csv
