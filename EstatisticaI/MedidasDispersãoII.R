
setwd("D:/DataScienceAcademy/PowerBI/Cap11")

getwd()

######################## Instala��o de Pacotes ########################
install.packages("ggplot2")
install.packages("")
install.packages("")
install.packages("")
install.packages("")
install.packages("")

######################## Carregamento dos Pacotes ########################
library(ggplot2)
library()
library()
library()
library()
library()

######################## Carrega o Dataset ########################
vendas <- read.csv("D:/DataScienceAcademy/PowerBI/Cap11/Vendas.csv", fileEncoding = "windows-1252")

######################## Resumo do Dataset ########################
?View
View(vendas)
str(vendas)
??sumary
summary(vendas$Valor)
summary(vendas$Custo)

######################## Vari�ncia ########################
var(vendas$Valor)

######################## Desvio Padr�o ########################
sd(vendas$Valor)