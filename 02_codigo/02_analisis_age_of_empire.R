### Age of empires

### Código elaborado por Toaki Hoz Canabal 


# Con base en los datos del código 01_cargando_datos, se utilizará wins_popularidad, relacion_uni_ampliado

# Borramos todo lo demás/ To remove all except x and a

rm(list=ls()[! ls() %in% c("wins_popularidad","relacion_uni_ampliado")])


### CArgamos paquetes
pacman::p_load(gghighlight,rvest, scico, tidyverse, tidytext,visNetwork )

### Graficamos la red
edges <- relacion_uni_ampliado %>% 
  rename(from = name_unit,
         to = name_unit_weakness) %>% 
  select(from, to) %>% 
  drop_na()

nodes <- relacion_uni_ampliado %>% 
  select(name_unit) %>% 
  rename(id = name_unit) %>% 
  mutate(label = id) %>% 
  drop_na() %>% 
  distinct()

visNetwork(nodes, edges,
           height = "700px",
           width = "100%") %>% 
  visPhysics(stabilization = FALSE)  %>% 
  # visLayout(randomSeed = 12) %>% 
  # visHierarchicalLayout() 
  visConfigure(enabled = TRUE) # Para configurar y establecerlo en los parámetros de código

