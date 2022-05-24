#transformar y calcular metricas en una vble ej 1
paisesOrdenados <- mispaises %>%
  group_by(continente) %>%
  mutate(poblacion_continente = sum(poblacion)) %>%
  ungroup() %>%
  mutate(poblacion_mundial = sum(poblacion_continente)) %>%
  mutate(porcentaje = poblacion_continente / poblacion_mundial * 100) %>%
  filter(pais == "Brasil")

view(paisesOrdenados)

#transformar y calcular metricas en una vble ej 2
poblacionOrdenada = mispaises %>%
                    filter(anio == 2007) %>%
                    group_by(continente) %>%
                    summarise(poblacion_continente = sum(poblacion)) %>%
                    ungroup() %>%
                    mutate(poblacion_mundial = sum(poblacion_continente)) %>%
                    group_by(continente)%>%
                    mutate(porcentaje = poblacion_continente/poblacion_mundial*100) %>%
                    ungroup()%>%
                    arrange(desc(porcentaje))

view(poblacionOrdenada)
#Mapear la bd ordenada a una grafica
#parametros: data recibe una base ordenada
#            mapping hace el mapeo en el grafico vbles x e y
#siempre guardar el rdo del ggplot en una vble

rdo = ggplot(data = poblacionOrdenada,
             mapping = aes(x = continente,
                           y= porcentaje,
                           col = continente)) #defino q el color depende del continente y automaticamente crea una leyenda

#definir la geometria de una grafica
rdo = rdo + geom_point()

#defino labels del grafico
rdo = rdo + labs(title = "Grafico de la poblacion",
                 x = "los continentes",
                 y = "% de población")

#dibujar la grafica definida
print(rdo)
