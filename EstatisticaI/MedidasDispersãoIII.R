
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
amostras <- read.csv("D:/DataScienceAcademy/PowerBI/Cap11/amostras.csv", fileEncoding = "windows-1252")

######################## Resumo do Dataset ########################
?View
View(amostras)
str(amostras)
??sumary
summary(amostras$AmostraA)
summary(amostras$AmostraB)

######################## Resumo ########################

#### M�dia
# A m�dia de uma vari�vel de observa��o � uma medida num�rica da localiza��o central 
#dos valores dos Dados.

# � a soma de seus valores de Dados divididos pela contagem de Dados.

#### Mediana
# A mediana de uma vari�vel � o valor no meio quando os Dados s�o classificados em
#ordem crescente ou decrescente.

#### Vari�ncia
# A vari�ncia � uma medida num�rica de como os valores dos Dados est�o dispersos em
#torno da m�dia.

#### Desvio Padr�o
# O desvio padr�o de uma vari�vel � a raiz quadrada de sua vari�ncia.

######################## Exemplo 01 ########################

# Comparar as amostras dos pre�os e a��es
# Quais medidas utilizar ?
# M�dia, Desvio Padr�o e Coeficiente de Varia��o

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
# Vari�ncia

var(amostras$AmostraA)
var(amostras$AmostraB)

######################## Exemplo 03 ########################

# Comparar as amostras na produ��o de camisas
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