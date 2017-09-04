library(RSimpleCrop)
setwd("~/Dropbox/tcc-felipe/RsimpleCrop/RSimpleCrop/data")
weather <- read.table("WEATHER.INP")
irrig <- read.table("IRRIG.INP")

soil <- param.soil(soil.WPp = 0.06,soil.FCp = 0.17,soil.STp = 0.28, 
                   soil.DP = 145.000,
                   soil.DRNp = 0.10, soil.CN = 55.00,soil.SWC = 246.5)

ctrl <- param.simCtrl(date.doyp = 121,date.frop = 1)

plant <- param.plant(plant.Lfmax = 12.0,plant.EMP2 = 0.64,plant.EMP1 = 0.104,
                     plant.PD = 5.0,plant.nb = 5.3,
                     plant.rm = 0.100,plant.fc = 0.85, plant.tb = 10.0, 
                     plant.intot = 300.0,
                     plant.n = 2.0, plant.lai = 0.013, plant.w = 0.3, 
                     plant.wr = 0.045,
                     plant.wc = 0.255, plant.p1 = 0.03, plant.f1 = 0.028)


out<-runSimpleCrop(weather = weather,plant = plant,soil = soil,irri = irrig,simCtrl = ctrl)
wbal <-out$wbal
sw <-out$sw
p<-out$plant
par(mfrow=c(2,3))
plot(p$`Day of Year`,p$`Numer of Leafs Nodes`,xlab = "Day of Year",ylab = "Numer of Leafs Nodes")
plot(p$`Day of Year`,p$`Plant Weight (g/m2)`,xlab = "Day of Year",ylab = "Plant Weight (g/m2)")
plot(p$`Day of Year`,p$`Canopy Weight (g/m2)`,xlab = "Day of Year",ylab = "Canopy Weight (g/m2)")
plot(p$`Day of Year`,p$`Root Weight (g/m2)`,xlab = "Day of Year",ylab = "Canopy Weight (g/m2)")
plot(p$`Day of Year`,p$`Fruit weight (g/m2)`,xlab = "Day of Year",ylab = "Fruit weight (g/m2)")
plot(p$`Day of Year`,p$`Leaf Area Index (m2/m2)`,xlab = "Day of Year",ylab = "Leaf area index(m2/m2)")

plot(sw$`Day of Year`,sw$`Solar Rad.(MJ/m2)`,xlab = "Day of Year",ylab = "Solar Rad.(MJ/m2)")
plot(sw$`Day of Year`,sw$`Pot.Evapo-Trans`,xlab = "Day of Year",ylab = "Pot.Evapo-Trans")
plot(sw$`Day of Year`,sw$`Actual Soil Evap.`,xlab = "Day of Year",ylab = "Actual Soil Evap.")
plot(sw$`Day of Year`,sw$`Actual Plant Trans.`,xlab = "Day of Year",ylab = "Actual Plant Trans.")
plot(sw$`Day of Year`,sw$`Soil Water Content(mm)`,xlab = "Day of Year",ylab = "Soil Water Content(mm)")
plot(sw$`Day of Year`,sw$`Drought Stress Factor`,xlab = "Day of Year",ylab = "Drought Stress Factor")

