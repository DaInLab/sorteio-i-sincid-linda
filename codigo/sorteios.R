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
<<<<<<< HEAD
setwd('D:/sorteio-i-sincid-linda')
=======
#setwd('D:/SINCID_SORTEIO')

# Solução alternativa !
get_os <- function(){
  sysinf <- Sys.info()
  if (!is.null(sysinf)){
    os <- sysinf['sysname']
    if (os == 'Darwin')
      os <- "osx"
  } else { ## mystery machine
    os <- .Platform$OS.type
    if (grepl("^darwin", R.version$os))
      os <- "osx"
    if (grepl("linux-gnu", R.version$os))
      os <- "linux"
  }
  tolower(os)
}

if (get_os() == "windows") {
  # Diretorio da Trabalho
  setwd('D:/SINCID_SORTEIO')
}

if (get_os() == "osx") {
  # Diretorio da Trabalho
  setwd("/Users/joaopedroalbino/Downloads/GitHub/sorteio-i-sincid-linda")
}

>>>>>>> f5e8b7edbb9f202b0047c7a005c29bbd26be44b0

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
<<<<<<< HEAD
=======
sorteado <- data.frame(Nome_sorteado)
>>>>>>> f5e8b7edbb9f202b0047c7a005c29bbd26be44b0

# Gravar arquivo INSCRITO.CSV atualizado
writexl::write_xlsx(df.participantes, './dados/ListaCredenciamento.xlsx')

