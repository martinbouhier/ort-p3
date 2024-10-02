# Install and load the library if you don't have it
# install.packages("ggplot2") # nolint
library(ggplot2)
library(caTools)

### Step 1: Importar el juego de datos test ###

# Set the path to your CSV file
file_path <- "./test.csv"

# Read the CSV file
data <- read.csv(file_path)

# Print the data to check
print("Leyendo los datos")

### Step 2: Analizando la estructura de los datos (dim y str) ###

# Print the dimensions of the data
paste("Los datos originales tienen:", dim(data)[1], "filas y", dim(data)[2], "columnas")

# Fijar una semilla para reproducibilidad
set.seed(123)

# Dividir los datos en 70% para entrenamiento y 30% para prueba
print("Dividiendo los datos en train y test donde el 70% de los datos son de entrenamienot y el 30% son de testeo")
split <- sample.split(data$y, SplitRatio = 0.7)

# Crear los datasets de entrenamiento y prueba
train_data <- subset(data, split == TRUE)
test_data <- subset(data, split == FALSE)

# Verificar las dimensiones de los conjuntos
paste("Los datos de entrenamienot tienen:", dim(train_data)[1], "filas y", dim(train_data)[2], "columnas")  # Tamaño del conjunto de entrenamiento
paste("Los datos de entrenamienot tienen:", dim(test_data)[1], "filas y", dim(test_data)[2], "columnas")   # Tamaño del conjunto de prueba

### Step 3: Graficar los datos ###

# Plot the data
# Gráfico de dispersión solo con puntos
print("Graficando los datos originales...")
ggplot(data, aes(x = x, y = y)) +
  geom_point(color = "blue") +
  labs(title = "Gráfico de Puntos",
       x = "Eje X",
       y = "Eje Y") +
  theme_minimal()

### Step 4: Ajustar la recta usando instrucción lm y summary ###

# Fit a linear model
print("Optimizando modelo de regresion lineal...")
model <- lm(y ~ x, data = train_data)

# Print the summary of the model
print("Resumen del modelo: ")
print(summary(model))
print("Fin resumen del modelo: ")

# Step 5 Usando la función predict para predecir la variable dependiente usando el modelo
print("Prediciendo valores con datos de testeo")
test_data$predicted_y <- predict(model, newdata = test_data)

# Imprimir los datos con las predicciones
#print(head(test_data))  # Muestra las primeras filas para verificar

#Step 6 Graficar los datos y la línea de regresión con ggplot
print("Graficando datos de testeo: ")
ggplot(test_data, aes(x = x, y = y)) +
  geom_point(color = "blue") +  # Puntos originales del conjunto de prueba
  geom_line(aes(y = predicted_y), color = "red") +  # Línea de las predicciones
  labs(title = "Gráfico de datos de prueba con Línea de Regresión",
       x = "Eje X",
       y = "Valores") +
  theme_minimal()