setwd ("/Users/chienjungkao/Desktop/learning/Rladies/Rladies") 

#安裝套件(僅需執行一次)
install.packages(c("tidyverse", "ploty", "zoo", "lubridate", "rmarkdown","data.table", "DT", "kableExtra"), dependencies = TRUE)

#load packages
library(DT)
library(zoo)
library(plotly)
library(lubridate)
library(rmarkdown)
library(data.table)
library(tidyverse)
library(kableExtra)
options(dplyr.print_max=1e9)


train1<-read.csv("train.csv")  
train2<-fread("train.csv")
#str(train1)        #檢視所有欄位
str(train1[,1:10])  #避免佔用教材過大篇幅，僅顯示前十個欄位
#str(train2)
str(train2[,1:10])

train0<-read.csv("train.csv", stringsAsFactors = FALSE)
test0<-read.csv("test.csv", stringsAsFactors = FALSE)
dim(train0)  #training data共有1460個房子的資料，81個欄位
dim(test0)   #testing data共有1460個房子的資料，80個欄位

##小挑戰
#根據房屋整體狀況來分組，新增“平均屋齡”欄位
dat<-train0%>%                         
  group_by(OverallCond)%>%
  mutate(average_YearBuilt=mean(YearBuilt))%>%    
  select(Id, OverallCond, YearBuilt, average_YearBuilt)
dat[1:10,]  

