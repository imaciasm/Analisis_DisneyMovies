#!/bin/bash

#Se han utilizado recursos CSS para la mejora visual, un ejemplo ellos son:
# bgcolor. Esto hace referencia al background color, es decir, color para el fondo.
# align y valign. Se utiliza para posicionar elementos como tablas o texto dentro del html.
# border. Permite ajustar el tamaño de los bordes de las tablas.
# font size. Aunque este a modo de etiqueta, también es una propiedad CSS que permite ajustar el tamaño de la fuente.
# font color. Aunque este a modo de etiqueta, también es una propiedad CSS que permite ajustar el tamaño de la fuente.

echo "<html>"
echo "<body bgcolor = 'LightCyan'>"
#Abrimos primera tabla que engloba dos tablas más en su interior.
echo "<table border = '2' align = 'left'>"

	#Titulo para Genero
        echo "<tr>"
		echo "<td bgcolor = 'MidnightBlue' align = 'center' ><font size = 3><font color = 'Gold'><b> \$\$ AGRUPACIÓN POR GENERO \$\$ </b> </font color></font size><td>"
	echo "</tr>"

                echo "<td valign = 'top'>"
			#Abrimos primera subtabla
                        echo "<table border = '4' align = 'center'>"
				#Cabecera para Genero
                                echo "<tr bgcolor = 'darkgray' align = 'center'>"
                                        echo "<td><b> Nº </b></td>"
                                        echo "<td><b> Genero <b></td>"
                                        echo "<td><b> Nº películas </b></td>"
                                        echo "<td><b> Bruto </b></td>"
                                        echo "<td><b> Total </b></td>"
					echo "<td><b> Media por película </b></td>"
                                echo "</tr>"
#Recorremos el archivo genero_disney.csv y añadimos a las variables los valores que posteriormente se van
#a mostrar dentro de la tabla.
num=0
cat genero_disney.csv | while IFS= read -r line
do
        num=$(( $num + 1 ))
        genero=$(echo $line | cut -d, -f1)
        cantidad=$(echo $line | cut -d, -f2)
	#A las unidades numericas se le añaden separación por millares para una mejor visualización.
        bruto=$(echo $line | cut -d, -f3 | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')
        total=$(echo $line | cut -d, -f4 | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')
	total2=$(echo $line | cut -d, -f4)
	media=$(echo "$((total2 / cantidad))" | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')
				#Filas con los valores obtenidos
                                echo "<tr align = 'center'>"
                                        echo "<td><b>$num</b></td>"
                                        echo "<td><b>$genero</b></td>"
					echo "<td>$cantidad</td>"
                                        echo "<td>$bruto\$</td>"
                                        echo "<td><b>$total\$</b></td>"
					echo "<td><b>$media\$</b></td>"
                                echo "</tr>"
done
			#Cerramos primera subtabla
                        echo "</table>"
                echo "</td>"

	#Titulo para Clasificación
	echo "<tr>"
		echo "<td bgcolor = 'MidnightBlue' align = 'center' ><font size = 3><font color = 'Gold'><b> \$\$ AGRUPACIÓN POR CLASIFICACIÓN \$\$ </b> </font color></font size></td>"
	echo "</tr>"

		#Cabecera para Clasificación
                echo "<td valign = 'top'>"
			#Abrimos segunda subtabla
                        echo "<table border = '4' align = 'center' >"
				#Cabecera para Clasificación
                                echo "<tr bgcolor = 'darkgray' align = 'center'>"
                                        echo "<td><b> Nº </b></td>"
                                        echo "<td><b> Clasificación<b></td>"
                                        echo "<td><b> Nº películas </b></td>"
                                        echo "<td><b> Bruto </b></td>"
                                        echo "<td><b> Total </b></td>"
					echo "<td><b> Media por película </b></td>"
                                echo "</tr>"
#Recorremos el archivo rating_disney.csv y añadimos a las variables los valores que posteriormente se van
#a mostrar dentro de la tabla.
num=0
cat rating_disney.csv | while IFS= read -r line
do
        num=$(( $num + 1 ))
        clasificacion=$(echo $line | cut -d, -f1)
        cantidad=$(echo $line | cut -d, -f2)
	#A las unidades numericas se le añaden separación por millares para una mejor visualización.
        bruto=$(echo $line | cut -d, -f3 | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')
        total=$(echo $line | cut -d, -f4 | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')
	total2=$(echo $line | cut -d, -f4)
        media=$(echo "$((total2 / cantidad))" | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')
				#Filas con los valores de las variables
                                echo "<tr align = 'center'>"
                                        echo "<td><b>$num</b></td>"
                                        echo "<td><b>$clasificacion</b></td>"
                                        echo "<td>$cantidad</td>"
                                        echo "<td>$bruto\$</td>"
                                        echo "<td><b>$total\$</b></td>"
					echo "<td><b>$media\$</b></td>"
                                echo "</tr>"
done
			#Cerramos segunda subtabla
                        echo "</table>"
                echo "</td>"
#Cerramos primera tabla del conjunto
echo "</table>"
#Abrimos segunda tabla
echo "<table border = '1' align = 'rigth'>"

	#Título para años
	echo "<tr>"
		echo "<td bgcolor = 'MidnightBlue' align = 'center' ><font size = 3><font color = 'Gold'><b> \$\$ AGRUPACIÓN POR AÑO \$\$ </b> </font color></font size></td>"
	echo "</tr>"

                echo "<td valign = 'top'>"
                        echo "<table border = '4' align = 'center'>"
				#Cabecera para Años
                                echo "<tr bgcolor = 'darkgray' align = 'center'>"
                                        echo "<td><b> Nº </b></td>"
                                        echo "<td><b> Año <b></td>"
                                        echo "<td><b> Nº películas </b></td>"
                                        echo "<td><b> Bruto </b></td>"
                                        echo "<td><b> Total </b></td>"
					echo "<td><b> Media por película </b></td>"
                                echo "</tr>"

#Recorremos el archivo anyos_disney.csv y añadimos a las variables los valores que posteriormente se van
#a mostrar dentro de la tabla.
num=0
cat anyos_disney.csv | while IFS= read -r line
do
        num=$(( $num + 1 ))
        anyos=$(echo $line | cut -d, -f1)
        cantidad=$(echo $line | cut -d, -f2)
	#A las unidades numericas se le añaden separación por millares para una mejor visualización.
        bruto=$(echo $line | cut -d, -f3 | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')
        total=$(echo $line | cut -d, -f4 | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')
	total2=$(echo $line | cut -d, -f4)
        media=$(echo "$((total2 / cantidad))" | sed ':a;s/\B[0-9]\{3\}\>/.&/;ta')
				#Filas con los valores obtenidos
                                echo "<tr align = 'center'>"
                                        echo "<td><b>$num</b></td>"
                                        echo "<td><b>$anyos</b></td>"
                                        echo "<td>$cantidad</td>"
                                        echo "<td>$bruto\$</td>"
                                        echo "<td><b>$total\$</b></td>"
					echo "<td><b>$media\$</b></td>"
                                echo "</tr>"
done

                        echo "</table>"
                echo "</td>"
#Cerramos últimas etiquetas
echo "</table>"
echo "</body>"
echo "</html>"
