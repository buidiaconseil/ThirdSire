library(readr)
chiffres_cles_2018 <- read_delim("chiffres-cles-2018.csv", 
                                 ";", escape_double = FALSE, trim_ws = TRUE)
View(chiffres_cles_2018)
chiffres_cles_2015 <- read_delim("chiffres-cles-2015.csv", 
                                 ";", escape_double = FALSE, trim_ws = TRUE)
View(chiffres_cles_2015)

chiffre2018<-chiffres_cles_2018[,c(2,20,22:25)]
chiffre2017<-chiffres_cles_2018[,c(2,26,28:31)]
chiffre2016<-chiffres_cles_2018[,c(2,32,34:37)]
chiffre2015<-chiffres_cles_2015[,c(2,10,12:15)]
chiffre2014<-chiffres_cles_2015[,c(2,16,18:21)]
chiffre2013<-chiffres_cles_2015[,c(2,22,24:27)]

colnames(chiffre2018)<- c("Siren","Année","Durée","CA","Résultat","Effectif")
colnames(chiffre2017)<- c("Siren","Année","Durée","CA","Résultat","Effectif")
colnames(chiffre2016)<- c("Siren","Année","Durée","CA","Résultat","Effectif")
colnames(chiffre2015)<- c("Siren","Année","Durée","CA","Résultat","Effectif")
colnames(chiffre2014)<- c("Siren","Année","Durée","CA","Résultat","Effectif")
colnames(chiffre2013)<- c("Siren","Année","Durée","CA","Résultat","Effectif")

chiffre<-rbind(chiffre2013,chiffre2014,chiffre2015,chiffre2016,chiffre2017,chiffre2018)
chiffreClean <- chiffre[complete.cases(chiffre), ]
nrow(chiffreClean)/6

chiffre2018Clean<-chiffre2018[complete.cases(chiffre2018), ]
chiffre2017Clean<-chiffre2017[complete.cases(chiffre2017), ]
chiffre2016Clean<-chiffre2016[complete.cases(chiffre2016), ]
chiffre2015Clean<-chiffre2015[complete.cases(chiffre2015), ]
chiffre2014Clean<-chiffre2014[complete.cases(chiffre2014), ]
chiffre2013Clean<-chiffre2013[complete.cases(chiffre2013), ]

chiffretraj=data.frame();
#Prepare for traj
for(i in 1:nrow(chiffre2013Clean)){
  siren<-chiffre2013Clean[i,]$Siren
  siren2013<-chiffre2013Clean[i,]
  siren2014<-unique(chiffre2014Clean[chiffre2014Clean$Siren==siren,])
  siren2015<-unique(chiffre2015Clean[chiffre2015Clean$Siren==siren,])
  siren2016<-unique(chiffre2016Clean[chiffre2016Clean$Siren==siren,])
  siren2017<-unique(chiffre2017Clean[chiffre2017Clean$Siren==siren,])
  siren2018<-unique(chiffre2018Clean[chiffre2018Clean$Siren==siren,])
  if(nrow(siren2014)>0 && nrow(siren2015)>0 && nrow(siren2016)>0 && nrow(siren2017)>0 && nrow(siren2018)>0){
    racc<-c(siren,
            siren2013$CA/siren2013$Durée*12,
            siren2014$CA/siren2014$Durée*12,
            siren2015$CA/siren2015$Durée*12,
            siren2016$CA/siren2016$Durée*12,
            siren2017$CA/siren2017$Durée*12,
            siren2018$CA/siren2018$Durée*12)    
    raccR<-c(
            siren2013$Résultat/siren2013$Durée*12,
            siren2014$Résultat/siren2014$Durée*12,
            siren2015$Résultat/siren2015$Durée*12,
            siren2016$Résultat/siren2016$Durée*12,
            siren2017$Résultat/siren2017$Durée*12,
            siren2018$Résultat/siren2018$Durée*12)    
    raccE<-c(
      siren2013$Effectif/siren2013$Durée*12,
      siren2014$Effectif/siren2014$Durée*12,
      siren2015$Effectif/siren2015$Durée*12,
      siren2016$Effectif/siren2016$Durée*12,
      siren2017$Effectif/siren2017$Durée*12,
      siren2018$Effectif/siren2018$Durée*12)
    racc<-cbind(t(as.matrix(racc)),t(as.matrix(raccE)),t(as.matrix(raccR)))
    chiffretraj<-rbind(chiffretraj,racc)
    }
  
}

library(kml)
cldSDQ <- cld(chiffreClean, timeInData = 4:6)
