#built in datasets
library(help = "datasets")

##Vizualization
mtcars
##machine learning
#regression
View(Titanic)
#clustering
View(iris)
##with missing data
View(airquality)
##other datasets
View(women)
View(USArrests)


##importing csv
#base r
BASE_performance.df <- read.csv('data/StudentsPerformance.csv')

#from url
URL_performance <- read.csv("https://github.com/jsgriffin96/r_workshop_3/blob/master/data/StudentsPerformance.csv")

#tidyverse readR
#install.packages('readr')
library('readr')
READR_performance.df <- read_csv('data/StudentsPerformance.csv')


##Performance (may not use)
#install.packages("bench")
#library('bench')

#base
#bench::mark(read.csv('Iowa_Liquor_Sales.csv'))
#readR
#bench::mark(read_csv('Iowa_Liquor_Sales.csv'))


##importing excel file
#install.packages('xlsx')
library('xlsx')
XLSX_performance.df<-read.xlsx('StudentsPerformance.xlsx', 1)

#tidyverse
#install.packages('readxl')
library('readxl')
READXL_performance.df<-read_excel('data/StudentsPerformance.xlsx')

#access column name with space in it
READXL_performance.df$`parental level of education`

##import spss file
#install.packages('foreign')
library('foreign')
PsychBike <- read.spss('PsychBike.sav', use.value.label=TRUE, to.data.frame=TRUE)

##Importing from keyboard
#https://finance.yahoo.com/quote/dis/history?ltr=1
stocks <- read.delim("clipboard")

###saving data
write.csv(mtcars, 'data/cars.csv')

write.xlsx(mtcars, "data/cars.xlsx")

#install.packages("haven")
library('haven')
write_sav(mtcars, 'data/mtcars.sav')

#export chart/plot
hist(mtcars$mpg)



###Web scraping
library('rvest')
url<-"https://www.imdb.com/chart/bottom?pf_rd_m=A2FGELUUNOQJNL&pf_rd_p=4da9d9a5-d299-43f2-9c53-f0efa18182cd&pf_rd_r=Z2TFMCSJZQMJS52FPA69&pf_rd_s=right-4&pf_rd_t=15506&pf_rd_i=moviemeter&ref_=chtmvm_ql_8" #need to prime with working link, #6
webpage<-read_html(url)


title_html <- html_nodes(webpage, '#main a')
title <- html_text(title_html)
title
title = title[title!=" "]
title = title[title!=""]


year_html <- html_nodes(webpage, '.secondaryInfo')
year <- html_text(year_html)
year

rating_html <- html_nodes(webpage, 'strong')
rating <- html_text(rating_html)
rating

badMovies <- data.frame(title, year, rating)

