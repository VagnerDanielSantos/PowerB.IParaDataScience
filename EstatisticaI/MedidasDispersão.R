
getwd()

setwd("D:/DataScienceAcademy/PowerBI/Cap11")

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
view(vendas)
str(vendas)
??sumary
summary(vendas$Valor)
summary(vendas$Custo)

######################## M�dia ########################
?mean
mean(vendas$Custo)
mean(vendas$Valor)
mean(vendas$Valor, trim = 0.1) # Remove espa�os em brancos(poss�veis outliers)
mean(vendas$Valor, na.rm = TRUE) #na = Missing // rm = remove

######################## M�dia Ponderada ########################
?weighted.mean
weighted.mean(vendas$Valor, w = vendas$Custo)

######################## Mediana ########################
median(vendas$Valor)
median(vendas$Custo)

######################## Moda ########################
## Cria uma Fun��o ##
getmode <- function(v)
{
  uniqv <- unique(v)
  uniqv[which.max(tabulate(match(v, uniqv)))]
}
## Obt�m a Moda ##
result <- getmode(vendas$Valor)
print(result)

######################## Cria Gr�fico de M�dia ########################
ggplot(vendas) + stat_summary(
                             aes(x = vendas$Estado, y = vendas$Valor),
                             fun.y = mean, geom = "bar",
                             fill = "lightgreen", col = "grey50"
                            )