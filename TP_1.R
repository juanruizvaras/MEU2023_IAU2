#INSTRUMENTOS DE ANÁLISIS URBANO II - TRABAJO PRÁCTICO N°1

#EN PRIMER LUGAR, PROCEDÍ A INSTALAR LA LIBRERIA Y LEER LA BASE DE DATOS

library(tidyverse)

datos <- read.csv("https://cdn.buenosaires.gob.ar/datosabiertos/datasets/transporte-y-obras-publicas/bicicletas-publicas/usuarios_ecobici_2020.csv", stringsAsFactors = TRUE, encoding = "UTF-8")

#La base se trata de los Usuarios del Servicio Ecobici en el año 2020. El archivo analiza las diferentes características de los usuarios a nivel etario, origen, sexo, etc.

summary(datos)

#La información se organiza en la siguientes categorías: ID_Usuario, Genero de Usuario, Edad del usuario, Fecha de Alta del viaje, Hora en que el viaje se dió de alta y si el usuario posee o no DNI. En éste último caso diferencia a los extranjeros de residentes argentinos.
#Podemos ver al analizar la base, que hay un mayor número de usuarios hombre que de mujeres.
#Por otra parte, podemos ver que hay un mayor número de personas residentes con DNI que de extranjeros, que no poseen DNI.
#Respecto a la edad de los usuarios, podemos ver que hay diferentes edades que recorren los 10 deciles, pero hay valores que marcan un error, ya que hay usuarios de -38 años o 961 años que pueden distorsionar la muestra.
#Sobre los últimos ítems sobre fecha de alta u hora de alta, al representar los valores más repetidos, y en casos como la hora donde hay exactitudes muy altas, quedan en su mayoría los usuarios por fuera de los valores más representativos y sería más conveniente quizás agruparlos por lapsos de 60 minutos en caso de horas, o cada 10 días del mes.

#Para poder realizar un anális más certero y ajustado, reduciré la muestra al segundo centil, donde podré visualizar cómo se comportan los jovenes promedios que son usuarios de EcoBici.
datos20y30 <- datos[datos$edad_usuario >= 20 & datos$edad_usuario <= 30, ]


