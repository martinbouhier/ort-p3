# Install and load the library if you don't have it
# install.packages("ggplot2") # nolint
library(ggplot2)

### Step 1: Importar el juego de datos test ###

# Set the path to your CSV file
file_path <- "tp2/test.csv"

# Read the CSV file
data <- read.csv(file_path)

# Print the data to check
print(data)

### Step 2: Analizando la estructura de los datos (dim y str) ###

# Print the dimensions of the data
print(dim(data))

# Print the structure of the data
print(str(data))

### Step 3: Graficar los datos ###

# Plot the data
# Gráfico de dispersión solo con puntos
ggplot(data, aes(x = x, y = y)) +
  geom_point(color = "blue") +
  labs(title = "Gráfico de Puntos",
       x = "Eje X",
       y = "Eje Y") +
  theme_minimal()

### Step 4: Ajustar la recta usando instrucción lm y summary ###

# Fit a linear model
model <- lm(y ~ x, data = data)

# Print the summary of the model
print(summary(model))
