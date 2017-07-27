#analyzing the GLobal Terrorist Activities
require(data.table)
require(readr) #to read data faster

terror<-read_csv("F:/globalterrorismdb_0617dist.csv")

#checking the structure of data
str(terror)
summary(terror)
#a wide data set with lots of columns


#---------------------

#checking how many terrorist attacks were successfull

success<-as.data.frame(table(terror$success))
success$Var1<-ifelse(success$Var1==1,"Successful","Unsuccessful")
names(success)<-c("Attack","count")
#almost 90% of all attacks were successfull

ggplot(aes(x = Attack,y=count), data = success) + 
  geom_col(width=0.5,color="black",fill="purple")