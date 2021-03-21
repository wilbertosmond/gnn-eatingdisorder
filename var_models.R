#### Load packages ----
library("readxl")
library("graphicalVAR")
library("mlVAR")

setwd("C:/Users/wilbert osmond/Documents/Internship - Thesis 2.0/VAR Models (R)")


#### Task 1: graphicalVAR model ===============
Data1 <- read_excel("Patient20.xlsx")
Vars <- c("dh51", "dh52", "dh53", "dh54", "dh58")

Results <- graphicalVAR(
  Data1,
  idvar = "unique_id",
  vars = Vars,
  dayvar = "day",
  beepvar = "beepvar",
  gamma = 0,
)
plot(Results)
Results$PCC
Results$PDC


#### Task 2: mlVAR model ===============
Data2<-read_excel("df_EMA_cleaned.xlsx")
vars <- c("dh51", "dh52", "dh53", "dh54", "dh58")
length(unique(Data2$ID)) # number of participants

res <- mlVAR(Data2, vars, idvar="ID", dayvar="day", beepvar="beep", 
             lags = 1, temporal = "correlated", contemporaneous = "correlated")

plot(res, "temporal", layout = "circle", nonsig = "hide")
summary(res)