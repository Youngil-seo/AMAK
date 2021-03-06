
test<-gam(log(WEIGHT)~as.factor(YEAR)+s(length),gamma=1.4,data=Age_w)
new_data<-subset(Age_w,Age_w$YEAR==1980)
new_data$YEAR=1983
Age_w$WEIGHT[Age_w$YEAR==1980]<-exp(predict(test,newdata=new_data))


Weight<-subset(Age_w,is.na(Age_w$WEIGHT)==F)
WEIGHT<-aggregate(list(WEIGHT=Weight$WEIGHT),by=list(AGE=Weight$AGE1,YEAR=Weight$YEAR),FUN=mean)
grid=expand.grid(YEAR=sort(unique(WEIGHT$YEAR)),AGE=c(min(Age_w$AGE1):15))
WEIGHT_A<-merge(grid,WEIGHT,all=T)
test<-gam(log(WEIGHT)~as.factor(YEAR)+s(AGE,by=as.factor(YEAR)),gamma=1.4,data=subset(WEIGHT_A,is.na(WEIGHT_A$AGE)==F))
WEIGHT_A$pred<-exp(predict(test,newdata=WEIGHT_A))
WEIGHT_A$WEIGHT2<-WEIGHT_A$WEIGHT
WEIGHT_A$WEIGHT2[is.na(WEIGHT_A$WEIGHT2)==T]<-WEIGHT_A$pred[is.na(WEIGHT_A$WEIGHT2)==T]

GRID<-expand.grid(YEARS=c(1978:2011),AGE=c(1:15))
WEIGHT_B<-merge(GRID,WEIGHT_A,all=T)

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1978]= WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1980]
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1979]= WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1980]

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1981]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1980|WEIGHT_B$YEAR==1983],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1980|WEIGHT_B$YEAR==1983]),FUN=mean)$x
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1982]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1980|WEIGHT_B$YEAR==1983],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1980|WEIGHT_B$YEAR==1983]),FUN=mean)$x

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1984]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1983|WEIGHT_B$YEAR==1986],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1983|WEIGHT_B$YEAR==1986]),FUN=mean)$x
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1985]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1983|WEIGHT_B$YEAR==1986],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1983|WEIGHT_B$YEAR==1986]),FUN=mean)$x

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1987]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1986|WEIGHT_B$YEAR==1991],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1986|WEIGHT_B$YEAR==1991]),FUN=mean)$x
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1988]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1986|WEIGHT_B$YEAR==1991],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1986|WEIGHT_B$YEAR==1991]),FUN=mean)$x
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1989]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1986|WEIGHT_B$YEAR==1991],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1986|WEIGHT_B$YEAR==1991]),FUN=mean)$x
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1990]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1986|WEIGHT_B$YEAR==1991],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1986|WEIGHT_B$YEAR==1991]),FUN=mean)$x

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1992]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1991|WEIGHT_B$YEAR==1994],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1991|WEIGHT_B$YEAR==1994]),FUN=mean)$x
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1993]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1991|WEIGHT_B$YEAR==1994],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1991|WEIGHT_B$YEAR==1994]),FUN=mean)$x

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1995]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1994|WEIGHT_B$YEAR==1997],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1994|WEIGHT_B$YEAR==1997]),FUN=mean)$x
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1996]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1994|WEIGHT_B$YEAR==1997],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1994|WEIGHT_B$YEAR==1997]),FUN=mean)$x

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1998]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1997|WEIGHT_B$YEAR==2000],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1997|WEIGHT_B$YEAR==2000]),FUN=mean)$x
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1999]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==1997|WEIGHT_B$YEAR==2000],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==1997|WEIGHT_B$YEAR==2000]),FUN=mean)$x

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2001]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2000|WEIGHT_B$YEAR==2002],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==2000|WEIGHT_B$YEAR==2002]),FUN=mean)$x

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2003]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2004|WEIGHT_B$YEAR==2002],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==2002|WEIGHT_B$YEAR==2004]),FUN=mean)$x

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2005]= aggregate(WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2006|WEIGHT_B$YEAR==2004],by=list(WEIGHT_B$AGE[WEIGHT_B$YEAR==2004|WEIGHT_B$YEAR==2006]),FUN=mean)$x

WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2007]= WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2006]
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2008]= WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2006]
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2009]= WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2006]
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2010]= WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2006]
WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2011]= WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==2006]

AGE_WEIGHT<-data.frame(matrix(ncol=15,nrow=length(unique(WEIGHT_B$YEAR))))
names(AGE_WEIGHT)<-c("YEAR","A2","A3" ,"A4","A5","A6","A7","A8","A9","A10","A11","A12","A13","A14","A15")
AGE_WEIGHT$YEAR<-c(1978:2011)

Years1<-c(1978:2011)
for( i in 1:length(Years1)){
AGE_WEIGHT[i,2:15]<-WEIGHT_B$WEIGHT2[WEIGHT_B$YEAR==Years1[i]][2:15]
}



