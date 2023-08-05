#!/usr/bin/

#En este script se va a obtener para cada coincidencia única la suma de las ganancias brutas y las
#ganancias totales pudiendo tener una vista de los beneficios de la empresa agrupados de varios modos.

BEGIN{
#Campo separador por comas
FS=","
}
{
#Filtramos las columnas en forma de array
#Columnas para anyo
anyo[NR] = $7
uniq_anyo[NR] = $8
cant_anyo[NR] = $9

#Columnas para genero
genero[NR] = $3
uniq_genero[NR] = $10
cant_genero[NR] = $11

#Columnas para rating
rating[NR] = $4
uniq_rating[NR] = $12
cant_rating[NR] = $13

#Columnas con las ganancias
bruto_total[NR] = $5
ganancia_total[NR] = $6
}
END{
#Cálculos ganancias agrupadas por genero
#--------------------------------------------
gan_genero[1] = "gan_genre"
tot_genero[1] = "tot_genre"
#Se añade el número de registros que tiene la columna
for (i=2;i<=14;i++)
{
        for (g in genero)
        {
                if (uniq_genero[i] == genero[g]) tot_genero[i]=tot_genero[i] + bruto_total[g];
                if (uniq_genero[i] == genero[g]) gan_genero[i]=gan_genero[i] + ganancia_total[g];
        }
}
#Creamos fichero con toda la información de genero unida.
for (i in gan_genero){
	if (i > 1) printf "%s,%i,%i,%i\n", uniq_genero[i], cant_genero[i], tot_genero[i], gan_genero[i] | "sort -t, -r -nk4 > genero_disney.csv";
}

#Cálculos ganancias agrupadas por anyos
#--------------------------------------------
gan_anyo[1] = "gan_year"
tot_anyo[1] = "tot_year"
#Se añade el numero de registros que tiene la columna
for (i=2;i<=55;i++)
{
        for (a in anyo)
        {
                if (uniq_anyo[i] == anyo[a]) tot_anyo[i]=tot_anyo[i] + bruto_total[a];
                if (uniq_anyo[i] == anyo[a]) gan_anyo[i]=gan_anyo[i] + ganancia_total[a];
        }
}
#Creamos fichero con toda la información de los años unida.
for (i in gan_anyo){
	if (i > 1) printf "%i,%i,%i,%i\n", uniq_anyo[i], cant_anyo[i], tot_anyo[i], gan_anyo[i] | "sort -t, -r -nk4 > anyos_disney.csv";
}

#Cálculos ganancias agrupadas por clasificación
#----------------------------------------------
gan_rating[1] = "gan_rating"
tot_rating[1] = "tot_rating"
#Se añade el numero de registros que tiene la columna
for (i=2;i<=6;i++)
{
        for (r in rating)
        {
                if (uniq_rating[i] == rating[r]) tot_rating[i]=tot_rating[i] + bruto_total[r];
                if (uniq_rating[i] == rating[r]) gan_rating[i]=gan_rating[i] + ganancia_total[r];
        }
}
#Creamos fichero con toda la información de las clasificaciones unida.
for (i in gan_rating){
	if (i > 1) printf "%s,%i,%i,%i\n", uniq_rating[i], cant_rating[i], tot_rating[i], gan_rating[i] | "sort -t, -r -nk4 > rating_disney.csv";
}

}
