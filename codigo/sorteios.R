# Instalando pacotes
if (!("ggplot2") %in% installed.packages()) install.packages("ggplot2")   
if (!("dplyr") %in% installed.packages()) install.packages("dplyr")
if (!("readxl") %in% installed.packages()) install.packages("readr")
if (!("writexl") %in% installed.packages()) install.packages("writexl")
if (!("geobr") %in% installed.packages()) install.packages("geobr")
if (!("scales") %in% installed.packages()) install.packages("scales")
if (!("ggspatial") %in% installed.packages()) install.packages("ggspatial")
if (!("kableExtra") %in% installed.packages()) install.packages("kableExtra")
if (!("knitr") %in% installed.packages()) install.packages("knitr")

library(ggplot2) # Visualizacao dos dados
library(dplyr)   # Preparacao de dados
library(readxl)  # Importacao dos dados
library(writexl) # Importacao dos dados
library(geobr)   # Mapa do Brasil
library(scales)
library(ggspatial)
library(flexdashboard)
library(knitr)
library(kableExtra)

# Diretorio de Trabalho
setwd('D:/sorteio-i-sincid-linda')

# Dataframe Inscricoes Importacao arquivo CSV
df.participantes <- read_excel("./dados/ListaCredenciamento.xlsx")

# Dataframe Inscricoes Nao Sorteadas
df.sorteio <- df.participantes %>% filter(is.na(Sorteado))

# Qtde de Inscricoes para Sorteio
Qtde_Sorteio <- nrow(df.sorteio)

# ID Sorteado
id_sorteado <- sample(df.sorteio$ID,1)
id_sorteado

# DataFrame Inscricao Sorteada
df.sorteado <- df.participantes[df.participantes$ID == id_sorteado,]

df.participantes[df.participantes$ID == id_sorteado,]$Sorteado = "S"
df.participantes[df.participantes$ID == id_sorteado,]$DH_Sorteio = as.character(Sys.time())

# Dados do Sorteado
Nome_sorteado <- df.sorteado$Nome
Email_sorteado <-  df.sorteado$`E-mail`
Cidade_sorteado <- df.sorteado$Cidade
UF_sorteado <- df.sorteado$UF

# Mostrar o sorteado

# Gravar arquivo INSCRITO.CSV atualizado
writexl::write_xlsx(df.participantes, './dados/ListaCredenciamento.xlsx')

