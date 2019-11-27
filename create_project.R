rm(list=ls())
where<-"/home/nicolas/Rprojects/barraquer"
setwd(where)

name_of_newproject<-"eye_bank"
dir.create(name_of_newproject)

setwd(paste0("./",name_of_newproject))

dir.create("data")
dir.create("outputs")
dir.create("R")

setwd("./data")

dir.create("raw")
dir.create("Rdata")

setwd(where)

load_from_raw <- 
"#######################
###load data
#######################
rm(list=ls())
options(max.print=999999)
library(pacman)
p_load(here)
p_load(openxlsx)
p_load(tidyverse)
library(bueri)
oldir<-getwd()

####see available xlsx files to load
list.files(\"../data/raw\")%>%str_subset(\".xlsx\")
###asign the apropiate name file. without xlsx extencion
file_nm<-\"XXXX\"
###load file
wb <- paste0(\"../data/raw/\",file_nm,\".xlsx\")
getSheetNames(wb)
####load data
z0<-read.xlsx(wb, sheet =1, colNames = TRUE,na.strings = \"NA\")
####load dictionary
choix<-read.xlsx(wb, sheet =2, colNames = TRUE,na.strings = \"NA\")
###remove conection
remove(\"wb\")

###review choix
colnames(choix)
colnames(choix)<-c(\"var\",\"type\",\"cat\",\"Def\",\"outcome\",\"groups\")
####compare names in choix and in colnames of z0
tempcn<-data.frame(colnames(z0),choix$var,stringsAsFactors =F)
tempcn%>%filter(colnames.z0.!=choix.var)

###if minor diferences fix that
choix$var<-colnames(z0)
###search for duplicated names
choix$var%>%table()->a
a[a>1]  

###verify available types
choix$type%>%table

###create folder if it is not already created
if(!\"../data/Rdata\" %in% list.dirs(path=\"..\")){
  dir.create(\"../data/Rdata\")
}

###save files as RData
save(z0,choix,file=paste0(\"../data/Rdata\",\"/\",\"MO_ER.RData\"))
setwd(oldir)"
writeLines(load_from_raw, paste0(where,"/",name_of_newproject,"/","/R/Load_from_raw.R"))

readm <- "Proyecto in charge of Rodrigo Barrera, Banco de ojos"
writeLines(readm, paste0(where,"/",name_of_newproject,"/","/README.txt"))