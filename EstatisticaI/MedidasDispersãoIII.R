
setwd("D:/DataScienceAcademy/PowerBI/Cap11")

getwd()

######################## Instalação de Pacotes ########################
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
amostras <- read.csv("D:/DataScienceAcademy/PowerBI/Cap11/amostras.csv", fileEncoding = "windows-1252")

######################## Resumo do Dataset ########################
?View
View(amostras)
str(amostras)
??sumary
summary(amostras$AmostraA)
summary(amostras$AmostraB)

######################## Resumo ########################

#### Mèdia
# A média de uma variável de observação é uma medida numérica da localização central 
#dos valores dos Dados.

# É a soma de seus valores de Dados divididos pela contagem de Dados.

#### Mediana
# A mediana de uma variável é o valor no meio quando os Dados são classificados em
#ordem crescente ou decrescente.

#### Variância
# A variância é uma medida numérica de como os valores dos Dados estão dispersos em
#torno da média.

#### Desvio Padrão
# O desvio padrão de uma variável é a raiz quadrada de sua variância.

######################## Exemplo 01 ########################

# Comparar as amostras dos preços e ações
# Quais medidas utilizar ?
# Média, Desvio Padrão e Coeficiente de Variação

mean(amostras$AmostraA)
mean(amostras$AmostraB)

sd(amostras$AmostraA)
sd(amostras$AmostraB)

cvA <- sd((amostras$AmostraA) / mean(amostras$AmostraA)) * 100
cvB <- sd((amostras$AmostraB) / mean(amostras$AmostraB)) * 100

cvA
cvB

######################## Exemplo 02 ########################

# Comparar as amostras dos produtos fabricados
# Quais medidas utilizar ?
# Variância

var(amostras$AmostraA)
var(amostras$AmostraB)

######################## Exemplo 03 ########################

# Comparar as amostras na produção de camisas
# Quais medidas utilizar ?
# Moda

calculaModa <- function(v)
{
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}

calculaModa(amostras$AmostraA)
calculaModa(amostras$AmostraB)

######################## Exemplo 04 ########################

# Comparar as amostras das notas dos alunos
# Quais medidas utilizar ?
# Mediana

median(amostras$AmostraA)
median(amostras$AmostraB)