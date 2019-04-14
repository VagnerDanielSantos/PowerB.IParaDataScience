
###### SITE PARA GRÁFICOS ######
#http://www.r-graph-gallery.com#
################################

setwd("D:/DataScienceAcademy/PowerBI/Cap11")
getwd()

########## IMPORTAR PACOTES ##########
install.packages("ggplot2")
install.packages("plotrix")
install.packages("treemap")
install.packages("")
install.packages("")

########## INSTALAR PACOTES ##########

library(ggplot2)
library(plotrix)
library(treemap)
library()
library()

########## DADOS FAKE ##########
my_vector = c(3, 12, 5, 18, 45)
names(my_vector) = c("A", "B", "C", "D", "E")
my_vector

########## BARPLOT ##########
barplot(my_vector)
barplot(my_vector, col = c(1, 2, 3, 4, 5))
png("Barplot.png", width = 480, height = 480)
barplot(my_vector, col = rgb(0.5, 0.1, 0.6, 0.6), xlab = "Categorias", ylab = "Valores", main = "Barplot em R", ylim = c(0, 60))
dev.off()

########## GGPLOT2 ##########
install.packages("ggplot2")
head(mtcars)

########## BARPLOT ##########
ggplot(mtcars, aes(x = as.factor(cyl) )) + geom_bar()

ggplot(mtcars, aes(x = as.factor(cyl), fill = as.factor(cyl) )) + 
    geom_bar() + 
    scale_fill_manual(values = c("red", "green", "blue"))

########## CRIA DADOS FAKE ##########
data = data.frame(group = c("A", "B", "C", "D"), value = c(33, 62, 56, 67))

########## BARPLOT ##########
ggplot(data, aes(x = group, y = value, fill = group)) +
    geom_bar(width = 0.85, stat = "identity")

########## PIE CHART ##########
slices <- c(10, 12, 4, 16, 8)
lbis <- c("US", "UK", "Australian", "Germany", "Swiss" )
pie(slices, labels = lbis, main = c("Beer per Country"))

########## PIE CHART COM PERCENTUAIS ##########
slices <- c(10, 12, 4, 16, 8)
lbis <- c("US", "UK", "Australian", "Germany", "Swiss" )
pct <- round(slices / sum(slices) * 100)
lbis <- paste(lbis, pct)
lbis <- paste(lbis, "%", sep = "")
pie(slices, labels = lbis, col = rainbow(length(lbis)), main = "Beer per Country")

########## PIE CHART 3D ##########
install.packages("plotrix")

slices <- c(10, 12, 4, 16, 8)
lbis <- c("US", "UK", "Australian", "Germany", "Swiss" )
pie3D(slices, labels = lbis, explode = 0.1, main = "Beer per Country")

########## LINE CHART ##########
########## DADOS FAKE ##########
cars <- c(1, 3, 6, 4, 9)
trucks <- c(2, 5, 4, 5, 12)
motorcycle <- c(3, 1, 6, 9, 4)

########## PLOT ##########
plot(cars, type = "o", col = "blue", ylim = c(0, 12))
lines(trucks, type =  "o", pch = 22, lty = 2, col = "red")
lines(motorcycle, type = "o", pch = 25, lty = 5, col = "yellow")
title(main = "Autos", col.main = "green", font.main = 4)

########## BOX PLOT ##########
install.packages("ggplot2")

head(mpg)

########## PLOT ##########
ggplot(mpg, aes(x = reorder(class, hwy), y = hwy, fill = class)) +
    geom_boxplot() +
    xlab("class") +
    theme(legend.position = "Nome")

########## SCATTER PLOT (Diagrama de dispersão) ##########
install.packages("ggplot2")

data = data.frame(cond = rep(c("condition_1", "condition_2"), each = 10), my_x = 1:100 +
          rnorm(100, sd = 9), my_y = 1:100 + rnorm(100, sd = 16))

ggplot(data, aes(x = my_x, y = my_y)) + geom_point(shape = 1)

########## ADICIONA LINHA DE REGRESSÃO ##########
ggplot(data, aes(x = my_x, y = my_y)) + 
    geom_point(shape = 1) + 
    geom_smooth(method = lm, color = "red", se = FALSE)

########## ADICIONA SMOOTH ##########
ggplot(data, aes(x = my_x, y = my_y)) + 
  geom_point(shape = 1) + 
  geom_smooth(method = lm, color = "red", se = TRUE)

########## TREEMAP ##########
install.packages("treemap")

########## DADOS ##########
group = c(rep("group-1", 4), rep("group-2", 2), rep("group-3", 3))
subgroup = paste("subgroup", c(1, 2, 3, 4, 1, 2, 1, 2, 3), sep = "-")
value = c(13, 5, 22, 12, 11, 7, 3, 1, 23)
data = data.frame(group, subgroup, value)

########## LABELS ##########
treemap(
        data, index = c("group", "subgroup"),
        vSize = "value", type = "index",
        fontsize.labels = c(15,12),
        fontcolor.labels = c("white", "orange"),
        fontface.labels = c(2, 1), 
        bg.labels = c("transparent"),
        align.labels = list(c("center", "center"), c("right", "bottom")),
        overlap.labels = 0.5,
        inflate.labels = F,
        )

########## CUSTOMIZA O TREEMAP ##########
treemap(
        data, index = c("group", "subgroup"),
        vSize = "value", type = "index",
        border.col = c("black", "white"),
        border.lwds = c(7,2)
        )

########## HISTOGRAMA ##########
x <- mtcars$mpg

h <- hist(
          x, breaks = 10, col = "red", xlab = "Miles per Gallon",
          main = "Histograma com curva de distribuicao"
          )

xfit <- seq(min(x), max(x), length = 40)
yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
yfit <- yfit * diff(h$mids[1:2] * length(x))
lines(xfit, yfit, col = "blue", lwd = 2)

########## DATASET ##########
library(ggplot2)
data = data.frame(value = rnorm(100000))

########## CUSTOM BIRMING. DÁ UM TAMANHO AO BIN ##########
ggplot(
      data, aes(x = value)) +
      geom_histogram(binwidth = 0.05
      )

########## UNIFORM COLOR ##########
ggplot(
        data, aes(x = value)) +
        geom_histogram(binwidth = 0.2, color = "white", fill = rgb(0.2, 0.7, 0.1, 0.4)
      )

########## PROPORTIONAL COLOR ##########
ggplot(
        data, aes(x = value)) +
        geom_histogram(binwidth = 0.2, aes(fill = ..count..)
)