#uso la libreria datos q tienen bd en español
library(datos)

#guardo en vble el contenido d ela tabla paises de la bd datos
mispaises <- datos::paises

#muestro por consola el contenido
mispaises

#muestro con formato de tabla
mispaises %>% View()

#otra forma de mostrar con formato de tabla
View (mispaises)

#cargo la libreria para exportar csv
library(data.table)

#indica el directorio de trabajo
getwd()

#cambia el directorio de trabajo
#setwd("/files")

#importar un archivo csv, me agrega un id de fila
paisesCSV = fread("files/datos_paises.csv")

view(paisesCSV)

#importar archivo xlsx
library(readxl)

#con la funcion read_xlsx importo un archivo xlsx
paisesXLS = read_xlsx("files/datos_paises.xlsx")

view(paisesXLS)


