
getwd()

setwd("D:/DataScienceAcademy/PowerBI/Cap10")

dataset <- read.csv("D:/DataScienceAcademy/PowerBI/Cap10/Vendas.csv")

str(dataset)

plot(dataset$Valor, dataset$Custo)

install.packages("ggplot2")

library(ggplot2)

qplot(Valor, Custo, data = dataset, geom = "point", main = "Plot de Teste")

#############################################################################################
############################## MACHINE LEARNING #############################################
#############################################################################################
install.packages("Amelia")
install.packages("caret")
install.packages("dplyr")
install.packages("reshape")
install.packages("randomForest")
install.packages("ggplot2")
install.packages("e1071")

library(Amelia)
library(caret)
library(dplyr)
library(reshape)
library(ggplot2)
library(randomForest)
library(e1071)

dataset <- read.csv("D:/DataScienceAcademy/PowerBI/Cap10/credit-card.csv")

View(dataset)
str(dataset)
head(dataset)

###########################################################################################
########################### Transformando e Limpando os Dados #############################
###########################################################################################

# Converte os atributos IDADE, SEXO, ESCOLARIDADE, ESTADO CIVIL para fatores (categoria)

#IDADE
head(dataset$AGE)
dataset$AGE <- cut(dataset$AGE, c(0, 30, 50, 100), labels = c("Jovem", "Adulto", "Idoso") )
head(dataset$AGE)

#SEXO
head(dataset$SEX)
dataset$SEX <- cut(dataset$SEX, c(0, 1, 2), labels = c("Masculino", "Feminino") )
head(dataset$SEX)

#ESCOLARIDADE
head(dataset$EDUCATION)
dataset$EDUCATION <- cut(dataset$EDUCATION, c(0, 1, 2, 3, 4), labels = c("Pos Graduado", "Graduado", "Ensino Medio", "Outros") )
head(dataset$EDUCATION)

#ESTADO CIVIL
head(dataset$MARRIAGE)
dataset$MARRIAGE <- cut(dataset$MARRIAGE, c(-1, 0, 1, 2, 3), labels = c("Desconhecido", "Casado", "Solteiro", "Outros"))
head(dataset$MARRIAGE)

#PAGAMENTOS
dataset$PAY_0 <- as.factor(dataset$PAY_0)
dataset$PAY_2 <- as.factor(dataset$PAY_2)
dataset$PAY_3 <- as.factor(dataset$PAY_3)
dataset$PAY_4 <- as.factor(dataset$PAY_4)
dataset$PAY_5 <- as.factor(dataset$PAY_5)
dataset$PAY_6 <- as.factor(dataset$PAY_6)

#Altera a variável dependente para o tipo fator
dataset$default.payment.next.month <- as.factor(dataset$default.payment.next.month)
head(dataset)

#Renomeia a coluna da Classe
colnames(dataset)
colnames(dataset)[25] <- "Inadimplente"
colnames(dataset)

#Verifica valores Missing
sapply(dataset, function(x) sum(is.na(x)))
missmap(dataset, main = "Valores Missing Observados")
dataset <- na.omit(dataset)

#Remove a primeira coluna ID
dataset$ID <- NULL

#Total de Inadimplentes x Não-Inadimplentes
table(dataset$Inadimplente)

#Plot da distribuição usando ggplot
qplot(Inadimplente, data = dataset, geom = "bar") + theme(axis.text.x = element_text(angle = 90, hjust = 1) )


#Set The Seed
set.seed(12345)

#Amostragem estratificada. Selecione as linhas de acordo com a variable default.payment.next.month
TrainingDataIndex <- createDataPartition(dataset$Inadimplente, p = 0.45, list = FALSE)
TrainingDataIndex

#Cria Dados de treinamento como subconjunto do conjunto de Dados com números de índice da línha
#conforme identificada acima e todas as colunas
trainData <- dataset[TrainingDataIndex,]
table(trainData$Inadimplente)


#Verifica a proporção entre as aulas
prop.table(table(trainData$Inadimplente))

#Número de linhas em Dados de treino
nrow(trainData)

#Compara as porcentagens entre as classes de treinamento e Dados originais
DistribuitionCompare <- cbind(prop.table(table(trainData$Inadimplente)), prop.table(table(dataset$Inadimplente)))
colnames(DistribuitionCompare) <- c("Treinamento", "Original")
DistribuitionCompare

#Melt Data - Converte colunas em linhas
meltedDComp <- melt(DistribuitionCompare)
meltedDComp

#Plot para visualizar a distribuição do Treinamento x Original, é representativo ou existe sobre / sob amostragem ?
ggplot(meltedDComp, aes(x = X1, y = value)) + geom_bar(aes(fill = X2), stat = 'identity', position = 'dodge')

#Tudo que não está no Dataset de Treinamento está no Dataset de Teste, Observando o sinal(-)
testData <- dataset[-TrainingDataIndex,]

#Usando uma validação cruzada de 10 folds para treinar e validar modelo
TrainingParameters <- trainControl(method = 'cv', number = 10)

###########################################################################################
###################################### RANDOM FOREST ######################################
###########################################################################################

#construção do Modelo de Machine Learning
rf_model <- randomForest(Inadimplente ~ ., data = trainData)
rf_model

#Confere o erro do Modelo
plot(rf_model, ylim = c(0,0.36)) 
legend('topright', colnames(rf_model$err.rate), col = 1:3, fill = 1:3)

varImpPlot(rf_model)

#Obten-se as variáveis mais importantes
importance <- importance(rf_model)
varImportance <- data.frame(Variables = row.names(importance), Importance = round(importance[ , 'MeanDecreaseGini'], 2))

#Cria o Rank de variáveis baseado na importância
rankImportance <- varImportance %>% mutate(Rank = paste0('#', dense_rank(desc(Importance))))

#Uso do ggplot2 para visualizar a importância relativa das variáveis
ggplot(rankImportance, aes(x = reorder(Variables, Importance), y = Importance, fill = Importance)) +
  geom_bar(stat = "Identity") +
  geom_text(aes(x = Variables, y = 0.5, label = Rank), hjust = 0, vjust = 0.55, size = 4, color = 'red') +
  labs(x = 'Variables') +
  coord_flip()

#Previsões
predictionrf <- predict(rf_model, testData)

#Confusion Matrix
cmrf <- confusionMatrix(predictionrf, testData$Inadimplente, positive = "1")
cmrf

#Salva o Modelo
saveRDS(rf_model, file = "D:/DataScienceAcademy/PowerBI/Cap10/rf_model.rds")

#Carrega o Modelo
modelo <- readRDS("D:/DataScienceAcademy/PowerBI/Cap10/rf_model.rds")