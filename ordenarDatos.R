#libreria muy usada para manejo de datos
library(tidyverse)


mispaises %>% 
  select(pais) #mostrar una sola columna

mispaises %>% 
  filter(pais == "Brasil") #recibe una condicion para filtrar

#filtra las filas con pais = brasil y muestra solo la columna pais y esperanza de vida
mispaises %>% 
  filter(pais == "Brasil") %>% 
  select(pais, esperanza_de_vida)

#ordenar de menor a mayor por columna poblacion
mispaises %>%
  arrange(poblacion)

#ordenar en orden descendiente (mayor a menor) por columna poblacion
mispaises %>%
  arrange(desc(poblacion))

#combinar: filtrar, ordenar y seleccionar columnas
mispaises %>%
  filter(continente == "Europa") %>%
  arrange(desc(poblacion)) %>%
  select(pais, anio, poblacion)