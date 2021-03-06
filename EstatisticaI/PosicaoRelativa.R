
setwd("D:/DataScienceAcademy/PowerBI/Cap11")

getwd()

######################## Medida de Posi��o Relativa ########################

#### Carrega o Dataset ####

carros <- read.csv("D:/DataScienceAcademy/PowerBI/Cap11/carros.csv")

#### Resumo dos Dados ####

head(carros)
str(carros)
View(carros)

#### Medidas de Tend�ncia Central ####

summary(carros$ano)
summary(carros[c("preco", "kilometragem")])

#### Explora as vari�veis num�ricas ####

mean(carros$preco)
median(carros$preco)
quantile(carros$preco)
quantile(carros$preco, probs = c(0.01, 0.99))
quantile(carros$preco, seq(from = 0, to = 1, by = 0.20))
IQR(carros$preco) #Diferen�a entre Q3 e Q1
range(carros$preco)
summary(carros$preco)
diff(range(carros$preco))