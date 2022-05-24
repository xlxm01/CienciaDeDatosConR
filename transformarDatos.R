#agrupar datos por continente
mispaises %>%
  group_by(continente)

#agrupar datos por continente y sumar el total de poblacion
#resultado una tabla de dos columnas continente y poblacion_total
mispaises %>%
  group_by(continente)%>%
  summarise(poblacion_total = sum(poblacion)) #agrego nueva columna poblacion_total

#filtar por un año, agrupar datos por continente y metrica el total de poblacion
mispaises %>%
  filter(anio == 2007) %>%
  group_by(continente) %>%
  summarise(poblacion_total = sum(poblacion)) %>%
  ungroup() #es necesario para q las operaciones siguientes no consideren este grupo

#summarise remueve todas las demas columnas y me deja el grupo que arme y las columnas nuevas

#mutate deja las columnas y agrega una nueva fila
mispaises %>%
  filter(anio == 2007) %>%
  group_by(continente) %>%
  mutate(poblacion_total = sum(poblacion)) %>%
  ungroup() 

#agregamos una columna con poblacion mundial
mispaises %>%
  filter(anio == 2007) %>%
  group_by(continente) %>%
  summarise(poblacion_continente = sum(poblacion)) %>%
  ungroup() %>%
  mutate(poblacion_mundial = sum(poblacion_continente)) %>%
  mutate(porcentaje = poblacion_continente/poblacion_mundial*100) %>%
  arrange(desc(porcentaje))
