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






table(terror$attacktype1_txt)
#Most common terror attack is Bombing/Explosion

#Finding Succcessful attacks and their attack types
#percentage of Successful and unsuccessful attacks
#converting to a data frame
attackdf<-data.frame(table(terror$attacktype1_txt,
                           terror$success))



#Spreading the data frame
attackdf<-attackdf %>% spread(key = Var2,Freq)
colnames(attackdf)<-c("Type_of_Attack","Unsuccessful","Successful")

#Adding new columns which contain Percentage of Successful and Unsucesful attacks
attackdf<-attackdf%>% mutate(PerSuccessful=round((Successful/(Unsuccessful+Successful))*100,2), PerUnsuccessful=round((Unsuccessful/(Unsuccessful+Successful))*100,2))

attackdf

#Plotting
plot<-ggplot(aes(x = "" , y = Successful,fill=Type_of_Attack),data = attackdf) + 
  geom_bar(width=1 , stat="identity") + 
  theme(axis.line = element_blank(), 
        plot.title = element_text(hjust=0.5)) + 
  labs(title="Pie Chart of Count of the Types of Successful Attacks",
       x=NULL,y=NULL , fill = 'Type of Attack')


#Final Plot to make it a Pie Chart

plot + coord_polar(theta ="y" , start = 0)  + scale_color_brewer(palette = "Set1")


