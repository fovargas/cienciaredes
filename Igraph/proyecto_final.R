# Instar las librerías
if(!require(readxl)) install.packages("readxl")
if(!require(igraph)) install.packages("igraph")

# Cargar las librerías
library(readxl)
library(igraph)

# Leer los datos
data <- read_excel("C:/Data.xlsx")

# Crear un objeto de grafo
g <- graph_from_data_frame(data, directed = FALSE)

# Cargar los pesos
E(g)$weight <- data$Estudiantes

# Calcular el gradi
degree_centrality <- strength(g)

# Calcular las centralidades
closeness_centrality <- closeness(g)
betweenness_centrality <- betweenness(g)

# Calculate el grado de los nodos y el grado promedio
degree_values <- degree(g)
average_degree <- mean(degree_values)

# Imprimir las estadísticas
print(paste("Centralidad de nodos:", degree_centrality))
print(paste("Centralidad de cercanía:", closeness_centrality))
print(paste("Centralidad de intermediación:", betweenness_centrality))

# Imprimir el grado promedio
print(paste("Grado promedio:", average_degree))

# Get the adjacency matrix
adj_matrix <- get.adjacency(g)

# Print the adjacency matrix
print(adj_matrix)

# Calculate the degree, taking the weights into account
degree_centrality <- strength(g)

# Definir la distribución
layout <- layout_nicely(g)

# Definir el color para cada nodo
V(g)$color <- ifelse(V(g)$name %in% data$Source, "pink", "green")

labels <- substr(V(g)$name, 1, 10)

# Imprimir el grafo
plot(g, layout = layout, vertex.size = 10, edge.width = E(g)$weight, vertex.label=labels, vertex.label.cex=0.5)