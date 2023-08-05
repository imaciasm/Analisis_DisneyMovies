#!/bin/bash

#Antes de cada llamada a los scripts se añaden los permisos de ejecución necesarios.

chmod +x ./a.sh
./a.sh
echo "Script a.sh sin argumentos terminado"
echo "------------------------------------"
./a.sh -v
echo "Script a.sh con argumentos terminado"
echo "------------------------------------"

chmod +x ./b.sh
./b.sh
echo "Script b.sh terminado"
echo "---------------------"

chmod +x ./c_bash.sh
./c_bash.sh disney.csv
echo "Script c_bash.sh terminado"
echo "--------------------------"

chmod +x ./c_awk.awk
gawk -f ./c_awk.awk disney_clean.csv
echo "Script c_awk.awk terminado"
echo "--------------------------"

chmod +x ./d.sh
./d.sh > info_disney.html
echo "Script d.sh terminado"
echo "---------------------"

#Eliminamos aquellos archivos que ya no necesitamos
rm ./genero_disney.csv ./rating_disney.csv ./anyos_disney.csv


echo "Abriendo info_disney.html en firefox"
echo "------------------------------------"
#Esto abre de forma automatica el archivo info_disney.html con el navegador firefox
firefox info_disney.html
