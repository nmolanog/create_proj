rm(list=ls())
where<-"/media/nicolas/DATOS/Rprojects"
setwd(where)

name_of_newproject<-"PAI_in_AITD"
dir.create(name_of_newproject)

setwd(paste0("./",name_of_newproject))

dir.create("data")
dir.create("outputs")
dir.create("R")

setwd("./data")

dir.create("raw")
dir.create("Rdata")

setwd(where)