The Walt Disney Company, también llamada simplemente Disney, fue fundada en octubre de 1923 por los hermanos Walt and Roy O. Disney siendo a día de hoy el segundo conglomerado de medios de comunicación y entretenimiento estadounidense más grande del mundo. Para esta práctica se ha elegido un conjunto de datos sobre esta compañía cinematográfica, dicho dataset contiene un total de 579 registros con información sobre todas las películas producidas desde el año 1937 hasta el 2016.

El principal problema que se plantea resolver es lograr alcanzar unos niveles de cálculos de los que aún no dispone el conjunto de datos como puede ser la visualización de la ganancia total que ha habido en un año concreto o cual de los géneros es el que más dinero ha recaudado. Mediante la creación de scripts analizaremos y obtendremos los resultados de una forma sencilla y automática. Gracias a esta automatización podremos generar dichos cálculos siempre que queramos, aunque posteriormente se actualice y se añadan más registros al conjunto de datos.

Para esta práctica se ha utilizado el conjunto de datos CSV con nombre Disney_movies que contiene la siguiente información: 

1. Título de la película
2. Fecha de lanzamiento
3. Género 
4. Clasificación de la MPAA
5. Bruto total (En dólares)
6. Bruto ajustado por inflación (En dólares)

El archivo se obtiene clonando el repositorio del usuario sibeltan (https://github.com/sibeltan) en GitHub. En primer lugar, el script a.sh comprobará si ya tenemos el CSV descargado, de no ser así procederá a la clonación del repositorio. Para obtener información más concreta sobre el archivo a continuación se muestra la ejecución del script a.sh. Ejecución del Script a.sh sin argumentos y sin existir el archivo CSV:

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/bfb523a6-946f-47b0-8505-f921f385ad0a)

Ejecución del Script a.sh con el argumento -v existiendo el archivo CSV:

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/89084167-34a6-4963-9620-c5a797ea2800)

Importante: Si no disponemos del dataset y, por ende, hay que descargarlo, el sistema nos pedirá la contraseña de súper usuario (sudo) a la hora de desempaquetar el conjunto de datos del archivo descargado.

B. El objetivo del script b.sh es el de limpiar los datos para obtener un dataset sin errores, estas correcciones facilitan el trabajo a la hora de hacer cálculos y agrupaciones en los siguientes scripts sin tener que preocuparse de datos incompletos, incorrectos o inexactos. Para comprobar posibles errores se ha hecho una revisión de forma manual y algunas comprobaciones por terminal para poder encontrar y visualizar posibles problemas en la información que contiene el archivo. A continuación, se muestran un par de ejemplos de estos problemas encontrados y el resultado tras la ejecución del script.

La siguiente imagen muestra el archivo donde se pueden apreciar filas dentro de las columnas sin valores o incluso con valores a 0, lo cual no tiene sentido.

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/a281dcc1-847d-4557-ba9e-d364b1c34be0)

Tambien podemos ver como existen nombres de peliculas que contienen una coma en su interior, al ser un archivo de valores separados por comas, esto provoca que interprete la cantidad de columnas de forma erronea.

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/a73bd9ff-c8c9-4bc0-8a0d-41a78293df34)

Ejecución del Script b.sh:

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/555e4151-f322-4431-93b5-6ef410f9c1ae)

Observamos que el script se ha ejecutado sin problemas y aunque no muestra nada por terminal se ha encargado de arreglar los problemas que contenía el archivo CSV.

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/69f3e30d-33ce-41ef-88e7-3e21a05a24d9)

A continuación, se hace una breve descripción de los errores corregidos:

* Eliminación de coma dentro de cada registro, de no hacerlo la estructura del dataset no será igual en todas sus filas.
* Eliminación de dobles comillas dentro de los registros
* Sustitución de varios nombres concretos con una coma en su interior
* Eliminación de filas con valores no deseados
* Añadir Not Rated a las filas que no contengan información de la columna mpaa_rating
* Añadir Other a las filas que no contengan información en la columna genre

Los siguientes scripts se van a encargar de llevar a cabo la creación de nuevos conjuntos de datos, estos contendrán los valores únicos, numero de apariciones y cálculos de ganancias agrupados en varias estructuras distintas.

Ejecución del Script c_bash.sh:

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/8b67c159-9df8-4921-9a59-797b3d956d86)

Este script parte desde el fichero disney.csv y tiene tres objetivos principales:
* Crear una nueva columna con el año de lanzamiento que se obtiene a través de la columna fecha y mediante el cual se podrán calcular los elementos únicos por año.
* Obtener tanto los valores únicos como el número de apariciones de las columnas genre, rating y year, esta última se obtiene de la nueva columna creada.
* Todas las nuevas columnas creadas se añaden a un mismo dataset (disney_clean.csv) para que posteriormente el siguiente script pueda trabajar con todos los datos.

Ejecución del Script c_awk.awk:

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/94e85c93-3075-447b-9a0c-1fd750fb017c)

Este script parte del fichero disney_clean.csv y tiene tres objetivos principales: 
* Mediante los datos únicos obtenidos en el anterior script obtendremos las ganancias brutas y totales de cada género, clasificación y año.
* Ordenar las clasificaciones teniendo en cuenta las ganancias totales.
* Se crean 3 archivos separados con toda la información necesaria ya preparada para mostrar en el siguiente script.

Este último paso se distribuye en dos partes, visualización de la información mediante un formato de etiquetas (HTML) y hoja de estilo en cascada (CSS) y, además, se añade el cálculo de la media de beneficio obtenida por película. 

Ejecución del Script d.sh:

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/8377d88b-889f-4795-8aba-887f59f9e51e)

El resultado del ultimo script se redirige al fichero info_disney.html para que posteriormente se pueda abrir y visualizar con el navegador, en este caso se ha utilizado Firefox ya que es el que viene por defecto en el sistema operativo en el que se está trabajando.

Hacemos un resumen de todas las agrupaciones llevadas a cabo y toda la información que las componen:

AGRUPACIÓN POR GÉNERO

* Género: Cada valor único de la columna género.
* Nº películas: El número total de películas que contiene cada género.
* Bruto: El Beneficio Bruto total que se ha obtenido en la agrupación género.
* Total: El Beneficio Total obtenido después de la inflación.
* Media por película: Ganancia media que tiene cada película dentro de cada género.
* 
AGRUPACIÓN POR CLASIFICACIÓN

* Género: Cada valor único de la columna clasificación.
* Nº películas: El número total de películas que contiene cada clasificación.
* Bruto: El Beneficio Bruto total que se ha obtenido en la agrupación clasificación.
* Total: El Beneficio Total obtenido después de la inflación en la agrupación clasificación.
* Media por película: Ganancia media que tiene cada película dentro de cada clasificación.
* 
AGRUPACIÓN POR AÑO

* Género: Cada valor único de la columna año.
* Nº películas: El número total de películas que contiene cada año.
* Bruto: El Beneficio Bruto total que se ha obtenido en la agrupación año.
* Total: El Beneficio Total obtenido después de la inflación en la agrupación año.
* Media por película: Ganancia media que tiene cada película dentro de cada año.

Ejecución de firefox info_disney.html:

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/1ad96f91-5bab-43e0-b7e1-ae01442adc1e)

Podemos concluir gracias a esta nueva organización que los 5 géneros que más beneficio generan son aventura, comedia, musical, drama y acción. Como dato curioso se observa que, aunque el género aventura se encuentra en primer lugar dado a su beneficio total, el género que más ingresos genera por película es el musical, si bien se mantiene en tercera posición supone una diferencia de 113 películas menos en comparación al género de aventura, llegando a multiplicar la ganancia media por tres.

Si observamos la agrupación de la clasificación podemos ver que el orden descendente es G (Publico general), PG (Se sugiere orientación de los padres), PG-13 (Se advierte fuertemente a los padres), R (Restringido), es decir, cuanto más prohibitiva es la clasificación menos beneficios se obtiene, algo lógico teniendo en cuenta que se reduce el público al que puede dirigirse.

Por ultimo podemos observar que el mayor ingreso generado hasta la fecha es de una única película. Esta película se lanzó en el año 1937, cotejando la fecha en el dataset original podemos observar que la película de la que se trata es blanca nieves y los siete enanitos.

Ejecución del Script run.sh:

![image](https://github.com/imaciasm86/Analisis_DisneyMovies_BashScript/assets/141320922/15519481-4584-46d5-bcbf-83c43bcfa89b)

Para ejecutar los ficheros de forma automatizada:

* chmod +x run.sh
* ./run.sh

