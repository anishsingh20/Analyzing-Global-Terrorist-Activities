#analyzing the GLobal Terrorist Activities
require(data.table)
require(readr) #to read data faster

terror<-read_csv("F:/globalterrorismdb_0617dist.csv")

#checking the structure of data
str(terror)
summary(terror)
#a wide data set with lots of columns