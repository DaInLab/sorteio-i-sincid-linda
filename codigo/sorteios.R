# Instalando pacotes
if (!("ggplot2") %in% installed.packages()) install.packages("ggplot2")   
if (!("dplyr") %in% installed.packages()) install.packages("dplyr")
if (!("readr") %in% installed.packages()) install.packages("readr")
if (!("geobr") %in% installed.packages()) install.packages("geobr")
if (!("scales") %in% installed.packages()) install.packages("scales")
if (!("ggspatial") %in% installed.packages()) install.packages("ggspatial")
if (!("kableExtra") %in% installed.packages()) install.packages("kableExtra")
if (!("knitr") %in% installed.packages()) install.packages("knitr")

library(ggplot2) # Visualizacao dos dados
library(dplyr)   # Preparacao de dados
library(readr)   # Importacao dos dados
library(geobr)   # Mapa do Brasil
library(scales)
library(ggspatial)
library(flexdashboard)
library(knitr)
library(kableExtra)


# Diretorio de Trabalho
<<<<<<< HEAD
#setwd('D:/SINCID_SORTEIO')
=======
setwd('D:/SINCID_SORTEIO')
>>>>>>> ba22493f1ce655cf15d62189a8caa18d1f1acebd

# Dataframe Inscricoes Importacao arquivo CSV
df.inscritos <-read.csv("./dados/INSCRITOS.csv", header = TRUE, sep = ";", quote = "\"", dec = ".")

# Dataframe Inscricoes Nao Sorteadas
df.sorteio <- df.inscritos %>% filter(Sorteado == "N")

# Qtde de Inscricoes para Sorteio
Qtde_Sorteio <- nrow(df.sorteio)

# Numero Sorteado
num_inscricao_sorteado <- sample(df.sorteio$Num_inscricao,1)
num_inscricao_sorteado

# DataFrame Inscricao Sorteada
df.sorteado <- df.inscritos[df.inscritos$Num_inscricao == num_inscricao_sorteado,]
df.inscritos[df.inscritos$Num_inscricao == num_inscricao_sorteado,]$Sorteado = "S"
df.inscritos[df.inscritos$Num_inscricao == num_inscricao_sorteado,]$DH_Sorteio = as.character(Sys.time())

# Dados do Sorteado
Nome_sorteado <- df.sorteado$Nome
Cidade_sorteado <- df.sorteado$Cidade
UF_sorteado <-  df.sorteado$UF
Email_sorteado <-  df.sorteado$Email
Telefone_sorteado <- df.sorteado$Telefone
Modalidade_sorteado <- df.sorteado$Modalidade

# Mostrar o sorteado
sorteado <- data.frame(Nome_sorteado)


# Gravar arquivo INSCRITO.CSV atualizado
write_csv2(df.inscritos, file='./dados/INSCRITOS.csv')
