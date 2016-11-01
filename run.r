library(data.table)
library(rvest)
library(stringr)
library(tidyr)
library(rJava)
library(XLConnect)
library(dplyr)
library(reshape)
library(glmnet)

setwd("/home/jerry/Desktop/NFL/madden03")
data.files = list.files()
# Read the first file
df02 = readWorksheetFromFile(file=data.files[1], sheet=1)
# Loop through the xlsx files and merge them to the existing data frame
for (file in data.files[-1]) {
  newFile = readWorksheetFromFile(file=file, sheet=1)
  df02 = merge(df02, newFile, all=TRUE)
}
tr02<-df02[,c("Team","Name", "Position", "Overall.Rating")]
colnames(tr02)<-c("Team","LastName", "Position", "Overall")

setwd("/home/jerry/Desktop/NFL/madden04")
data.files = list.files()
# Read the first file
df03 = readWorksheetFromFile(file=data.files[1], sheet=1)
# Loop through the remaining files and merge them to the existing data frame
for (file in data.files[-1]) {
  newFile = readWorksheetFromFile(file=file, sheet=1)
  df03 = merge(df03, newFile, all=TRUE)
}
tr03<-df03[,c("Team","Name", "Position", "Overall")]
colnames(tr03)<-c("Team","LastName", "Position", "Overall")

setwd("/home/jerry/Desktop/NFL/madden05")
data.files = list.files()
# Read the first file
df04 = readWorksheetFromFile(file=data.files[1], sheet=1)
workbook <- loadWorkbook(data.files[1])
sheet_names <- getSheets(workbook)
sheet_names<-sapply(strsplit(sheet_names, split= "\\ "), function(x) x[length(x)])
Team <- rep_len(sheet_names, nrow(df04))
dim(Team) <- c(nrow(df04),1)
df04<-cbind(Team,df04)
# Loop through the remaining files and merge them to the existing data frame
for (file in data.files[-1]) {
  newFile = readWorksheetFromFile(file=file, sheet=1)
  workbook <- loadWorkbook(file)
  sheet_names <- getSheets(workbook)
  sheet_names<-sapply(strsplit(sheet_names, split= "\\ "), function(x) x[length(x)])
  Team <- rep_len(sheet_names, nrow(newFile))
  dim(Team) <- c(nrow(newFile),1)
  newFile<-cbind(Team,newFile)
  df04 = merge(df04, newFile, all=TRUE)
}
tr04<-df04[,c("Team","FIRSTNAME","LASTNAME", "Position", "OVERALLRATING")]
colnames(tr04)<-c("Team","FirstName","LastName", "Position", "Overall")

setwd("/home/jerry/Desktop/NFL/madden06")
data.files = list.files()
# Read the first file
df05 = readWorksheetFromFile(file=data.files[1], sheet=1)
workbook <- loadWorkbook(data.files[1])
sheet_names <- getSheets(workbook)
sheet_names<-sapply(strsplit(sheet_names, split= "\\ "), function(x) x[length(x)])
Team <- rep_len(sheet_names, nrow(df05))
dim(Team) <- c(nrow(df05),1)
df05<-cbind(Team,df05)
# Loop through the remaining files and merge them to the existing data frame
for (file in data.files[-1]) {
  newFile = readWorksheetFromFile(file=file, sheet=1)
  workbook <- loadWorkbook(file)
  sheet_names <- getSheets(workbook)
  sheet_names<-sapply(strsplit(sheet_names, split= "\\ "), function(x) x[length(x)])
  Team <- rep_len(sheet_names, nrow(newFile))
  dim(Team) <- c(nrow(newFile),1)
  newFile<-cbind(Team,newFile)
  df05 = merge(df05, newFile, all=TRUE)
}
tr05<-df05[,c("Team","FIRSTNAME","LASTNAME", "Position", "OVERALLRATING")]
colnames(tr05)<-c("Team","FirstName","LastName", "Position", "Overall")


setwd("/home/jerry/Desktop/NFL/madden07")
data.files = list.files()
# Read the first file
df06 = readWorksheetFromFile(file=data.files[1], sheet=1)
workbook <- loadWorkbook(data.files[1])
sheet_names <- getSheets(workbook)
sheet_names<-sapply(strsplit(sheet_names, split= "\\ "), function(x) x[length(x)])
Team <- rep_len(sheet_names, nrow(df06))
dim(Team) <- c(nrow(df06),1)
df06<-cbind(Team,df06)
# Loop through the remaining files and merge them to the existing data frame
for (file in data.files[-1]) {
  newFile = readWorksheetFromFile(file=file, sheet=1)
  workbook <- loadWorkbook(file)
  sheet_names <- getSheets(workbook)
  sheet_names<-sapply(strsplit(sheet_names, split= "\\ "), function(x) x[length(x)])
  Team <- rep_len(sheet_names, nrow(newFile))
  dim(Team) <- c(nrow(newFile),1)
  newFile<-cbind(Team,newFile)
  df06 = merge(df06, newFile, all=TRUE)
}
tr06<-df06[,c("Team","PLYR_FIRSTNAME","PLYR_LASTNAME", "Position", "PLYR_OVERALLRATING")]
colnames(tr06)<-c("Team","FirstName","LastName", "Position", "Overall")


setwd("/home/jerry/Desktop/NFL/madden08")
data.files = list.files()
# Read the first file
df07 = readWorksheetFromFile(file=data.files[1], sheet=1)
workbook <- loadWorkbook(data.files[1])
sheet_names <- getSheets(workbook)
sheet_names<-sapply(strsplit(sheet_names, split= "\\ "), function(x) x[length(x)])
Team <- rep_len(sheet_names, nrow(df07))
dim(Team) <- c(nrow(df07),1)
df07<-cbind(Team,df07)
# Loop through the remaining files and merge them to the existing data frame
for (file in data.files[-1]) {
  newFile = readWorksheetFromFile(file=file, sheet=1)
  workbook <- loadWorkbook(file)
  sheet_names <- getSheets(workbook)
  sheet_names<-sapply(strsplit(sheet_names, split= "\\ "), function(x) x[length(x)])
  Team <- rep_len(sheet_names, nrow(newFile))
  dim(Team) <- c(nrow(newFile),1)
  newFile<-cbind(Team,newFile)
  df07 = merge(df07, newFile, all=TRUE)
}
tr07<-df07[,c("Team","First_Name","Last_Name", "Position", "Overall_Rating")]
colnames(tr07)<-c("Team","FirstName","LastName", "Position", "Overall")


setwd("/home/jerry/Desktop/NFL/madden09")
data.files = list.files()
# Read the first file
df08 = readWorksheetFromFile(file=data.files[1], sheet=1)
workbook <- loadWorkbook(data.files[1])
sheet_names <- getSheets(workbook)
sheet_names<-sapply(strsplit(sheet_names, split= "\\ "), function(x) x[length(x)])
Team <- rep_len(sheet_names, nrow(df08))
dim(Team) <- c(nrow(df08),1)
df08<-cbind(Team,df08)
# Loop through the remaining files and merge them to the existing data frame
for (file in data.files[-1]) {
  newFile = readWorksheetFromFile(file=file, sheet=1)
  workbook <- loadWorkbook(file)
  sheet_names <- getSheets(workbook)
  sheet_names<-sapply(strsplit(sheet_names, split= "\\ "), function(x) x[length(x)])
  Team <- rep_len(sheet_names, nrow(newFile))
  dim(Team) <- c(nrow(newFile),1)
  newFile<-cbind(Team,newFile)
  df08 = merge(df08, newFile, all=TRUE)
}
tr08<-df08[,c("Team","FIRSTNAME","LASTNAME", "Position", "OVERALL")]
colnames(tr08)<-c("Team","FirstName","LastName", "Position", "Overall")


setwd("/home/jerry/Desktop/NFL/madden10")
data.files = list.files()
# Read the first file
df09 = readWorksheetFromFile(file=data.files[1], sheet=1)
# Loop through the remaining files and merge them to the existing data frame
for (file in data.files[-1]) {
  newFile = readWorksheetFromFile(file=file, sheet=1)
  df09 = merge(df09, newFile, all=TRUE)
}
tr09<-df09[,c("Team","First","Last", "POS", "OVR")]
colnames(tr09)<-c("Team","FirstName","LastName", "Position", "Overall")
tr09$Team[tr09$Team =="Bucs"] <- "Buccaneers"

setwd("/home/jerry/Desktop/NFL/madden11")
data.files = list.files()
# Read the first file
df10 = readWorksheetFromFile(file=data.files[1], sheet=1)
# Loop through the remaining files and merge them to the existing data frame
for (file in data.files[-1]) {
  newFile = readWorksheetFromFile(file=file, sheet=1)
  df10 = merge(df10, newFile, all=TRUE)
}
tr10<-df10[,c("TEAM","FIRST.NAME","LAST.NAME", "POSITION", "OVERALL.RATING")]
tr10<-na.omit(tr10)
colnames(tr10)<-c("Team","FirstName","LastName", "Position", "Overall")

#Format is too difficult to deal with
#setwd("/home/jerry/Desktop/NFL/madden12")
#data.files = list.files()
# Read the first file
#df11 = readWorksheetFromFile(file=data.files[1], sheet=1)
# Loop through the remaining files and merge them to the existing data frame
#for (file in data.files[-1]) {
#  newFile = readWorksheetFromFile(file=file, sheet=1)
#  df11 = merge(df11, newFile, all=TRUE)
#}
#tr11<-df11[,c("Team","First","Last", "POS", "OVR")]
#colnames(tr11)<-c("Team","FirstName","LastName", "Position", "Overall")

setwd("/home/jerry/Desktop/NFL")
train12<-fread("madden13.csv",data.table=FALSE)
train13<-fread("madden14.csv",data.table=FALSE)
train14<-fread("madden15.csv",data.table=FALSE)
train15<-fread("madden16.csv",data.table=FALSE)
tr12<-train12[,c("Team","First Name","Last Name", "Position", "Overall")]
tr13<-train13[,c("Team","First Name","Last Name", "Position", "Overall")]
tr14<-train14[,c("Team","First Name","Last Name", "Position", "Overall")]
tr15<-train15[,c("Team","First Name","Last Name", "Position", "OVR")]
colnames(tr12)<-c("Team","FirstName","LastName", "Position", "Overall")
colnames(tr13)<-c("Team","FirstName","LastName", "Position", "Overall")
colnames(tr14)<-c("Team","FirstName","LastName", "Position", "Overall")
colnames(tr15)<-c("Team","FirstName","LastName", "Position", "Overall")

tr12$Team[tr12$Team =="Bucs"] <- "Buccaneers"

#use web scraping to get Win% for each team from ESPN
url02 <- 'http://www.espn.com/nfl/standings/_/season/2002'
webpage <- read_html(url02)
standings02 <- html_nodes(webpage, 'table')
season02a <- html_table(standings02)[[1]]
season02b <- html_table(standings02)[[2]]
season02<-rbind(season02a, season02b)
Winpct02 <- season02[,c("X1","X5")]
colnames(Winpct02) <- c("Team", "Winpct")
Winpct02$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct02$Team)
Winpct02$Team[Winpct02$Team =="Francisco"] <- "49ers"

url03 <- 'http://www.espn.com/nfl/standings/_/season/2003'
webpage <- read_html(url03)
standings03 <- html_nodes(webpage, 'table')
season03a <- html_table(standings03)[[1]]
season03b <- html_table(standings03)[[2]]
season03<-rbind(season03a, season03b)
Winpct03 <- season03[,c("X1","X5")]
colnames(Winpct03) <- c("Team", "Winpct")
Winpct03$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct03$Team)
Winpct03$Team[Winpct03$Team =="Francisco"] <- "49ers"

url04 <- 'http://www.espn.com/nfl/standings/_/season/2004'
webpage <- read_html(url04)
standings04 <- html_nodes(webpage, 'table')
season04a <- html_table(standings04)[[1]]
season04b <- html_table(standings04)[[2]]
season04<-rbind(season04a, season04b)
Winpct04 <- season04[,c("X1","X5")]
colnames(Winpct04) <- c("Team", "Winpct")
Winpct04$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct04$Team)
Winpct04$Team[Winpct04$Team =="Francisco"] <- "49ers"

url05 <- 'http://www.espn.com/nfl/standings/_/season/2005'
webpage <- read_html(url05)
standings05 <- html_nodes(webpage, 'table')
season05a <- html_table(standings05)[[1]]
season05b <- html_table(standings05)[[2]]
season05<-rbind(season05a, season05b)
Winpct05 <- season05[,c("X1","X5")]
colnames(Winpct05) <- c("Team", "Winpct")
Winpct05$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct05$Team)
Winpct05$Team[Winpct05$Team =="Francisco"] <- "49ers"

url06 <- 'http://www.espn.com/nfl/standings/_/season/2006'
webpage <- read_html(url06)
standings06 <- html_nodes(webpage, 'table')
season06a <- html_table(standings06)[[1]]
season06b <- html_table(standings06)[[2]]
season06<-rbind(season06a, season06b)
Winpct06 <- season06[,c("X1","X5")]
colnames(Winpct06) <- c("Team", "Winpct")
Winpct06$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct06$Team)
Winpct06$Team[Winpct06$Team =="Francisco"] <- "49ers"

url07 <- 'http://www.espn.com/nfl/standings/_/season/2007'
webpage <- read_html(url07)
standings07 <- html_nodes(webpage, 'table')
season07a <- html_table(standings07)[[1]]
season07b <- html_table(standings07)[[2]]
season07<-rbind(season07a, season07b)
Winpct07 <- season07[,c("X1","X5")]
colnames(Winpct07) <- c("Team", "Winpct")
Winpct07$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct07$Team)
Winpct07$Team[Winpct07$Team =="Francisco"] <- "49ers"

url08 <- 'http://www.espn.com/nfl/standings/_/season/2008'
webpage <- read_html(url08)
standings08 <- html_nodes(webpage, 'table')
season08a <- html_table(standings08)[[1]]
season08b <- html_table(standings08)[[2]]
season08<-rbind(season08a, season08b)
Winpct08 <- season08[,c("X1","X5")]
colnames(Winpct08) <- c("Team", "Winpct")
Winpct08$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct08$Team)
Winpct08$Team[Winpct08$Team =="Francisco"] <- "49ers"

url09 <- 'http://www.espn.com/nfl/standings/_/season/2009'
webpage <- read_html(url09)
standings09 <- html_nodes(webpage, 'table')
season09a <- html_table(standings09)[[1]]
season09b <- html_table(standings09)[[2]]
season09<-rbind(season09a, season09b)
Winpct09 <- season09[,c("X1","X5")]
colnames(Winpct09) <- c("Team", "Winpct")
Winpct09$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct09$Team)
Winpct09$Team[Winpct09$Team =="Francisco"] <- "49ers"

url10 <- 'http://www.espn.com/nfl/standings/_/season/2010'
webpage <- read_html(url10)
standings10 <- html_nodes(webpage, 'table')
season10a <- html_table(standings10)[[1]]
season10b <- html_table(standings10)[[2]]
season10<-rbind(season10a, season10b)
Winpct10 <- season10[,c("X1","X5")]
colnames(Winpct10) <- c("Team", "Winpct")
Winpct10$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct10$Team)
Winpct10$Team[Winpct10$Team =="Francisco"] <- "49ers"

url12 <- 'http://www.espn.com/nfl/standings/_/season/2012'
webpage <- read_html(url12)
standings12 <- html_nodes(webpage, 'table')
season12a <- html_table(standings12)[[1]]
season12b <- html_table(standings12)[[2]]
season12<-rbind(season12a, season12b)
Winpct12 <- season12[,c("X1","X5")]
colnames(Winpct12) <- c("Team", "Winpct")
Winpct12$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct12$Team)
Winpct12$Team[Winpct12$Team =="Francisco"] <- "49ers"

url13 <- 'http://www.espn.com/nfl/standings/_/season/2013'
webpage <- read_html(url13)
standings13 <- html_nodes(webpage, 'table')
season13a <- html_table(standings13)[[1]]
season13b <- html_table(standings13)[[2]]
season13<-rbind(season13a, season13b)
Winpct13 <- season13[,c("X1","X5")]
colnames(Winpct13) <- c("Team", "Winpct")
Winpct13$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct13$Team)
Winpct13$Team[Winpct13$Team =="Francisco"] <- "49ers"

url14 <- 'http://www.espn.com/nfl/standings/_/season/2014'
webpage <- read_html(url14)
standings14 <- html_nodes(webpage, 'table')
season14a <- html_table(standings14)[[1]]
season14b <- html_table(standings14)[[2]]
season14<-rbind(season14a, season14b)
Winpct14 <- season14[,c("X1","X5")]
colnames(Winpct14) <- c("Team", "Winpct")
Winpct14$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct14$Team)
Winpct14$Team[Winpct14$Team =="Francisco"] <- "49ers"

url15 <- 'http://www.espn.com/nfl/standings/_/season/2015'
webpage <- read_html(url15)
standings15 <- html_nodes(webpage, 'table')
season15a <- html_table(standings15)[[1]]
season15b <- html_table(standings15)[[2]]
season15<-rbind(season15a, season15b)
Winpct15 <- season15[,c("X1","X5")]
colnames(Winpct15) <- c("Team", "Winpct")
Winpct15$Team <- sub(".*[A-Za-z]+\\s+([A-Z][a-z]+).*", "\\1", Winpct15$Team)
Winpct15$Team[Winpct15$Team =="Francisco"] <- "49ers"


#2002
v1 <- unique(tr02$Position)
tr02_final <-Map(function(x,y)
  filter(tr02, Position==x) %>%
    group_by(Team) %>% 
    #top_n(y, wt = Overall), v1, c(1, 2, 2, 1, 1,2,1,1,1,1,1,2,1,1,1,1,1,1,1,1,2)) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr02DF<-cast(tr02_final, Team~Position)

#2003
v1 <- unique(tr03$Position)
tr03_final <-Map(function(x,y)
  filter(tr03, Position==x) %>%
    group_by(Team) %>% 
    #top_n(y, wt = Overall), v1, c(1, 2, 2, 1, 1,2,1,1,1,1,1,2,1,1,1,1,1,1,1,1,2)) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr03DF<-cast(tr03_final, Team~Position)

#2004
v1 <- unique(tr04$Position)
tr04_final <-Map(function(x,y)
  filter(tr04, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr04DF<-cast(tr04_final, Team~Position)

#2005
v1 <- unique(tr05$Position)
tr05_final <-Map(function(x,y)
  filter(tr05, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr05DF<-cast(tr05_final, Team~Position)

#2006
v1 <- unique(tr06$Position)
tr06_final <-Map(function(x,y)
  filter(tr06, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr06DF<-cast(tr06_final, Team~Position)

#2007
v1 <- unique(tr07$Position)
tr07_final <-Map(function(x,y)
  filter(tr07, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr07DF<-cast(tr07_final, Team~Position)


#2008
v1 <- unique(tr08$Position)
tr08_final <-Map(function(x,y)
  filter(tr08, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr08DF<-cast(tr08_final, Team~Position)

#2009
v1 <- unique(tr09$Position)
tr09_final <-Map(function(x,y)
  filter(tr09, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr09DF<-cast(tr09_final, Team~Position)


#2010
v1 <- unique(tr10$Position)
tr10_final <-Map(function(x,y)
  filter(tr10, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr10DF<-cast(tr10_final, Team~Position)
tr10DF$FB[tr10DF$Team =="Vikings"] <- 83


#2012
v1 <- unique(tr12$Position)
tr12_final <-Map(function(x,y)
  filter(tr12, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr12DF<-cast(tr12_final, Team~Position)


#2013
v1 <- unique(tr13$Position)
tr13_final <-Map(function(x,y)
  filter(tr13, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr13DF<-cast(tr13_final, Team~Position)


#2014
v1 <- unique(tr14$Position)
tr14_final <-Map(function(x,y)
  filter(tr14, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>%  
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr14DF<-cast(tr14_final, Team~Position)

#2015
v1 <- unique(tr15$Position)
tr15_final <-Map(function(x,y)
  filter(tr15, Position==x) %>%
    group_by(Team) %>% 
    top_n(y, wt = Overall), v1, c(1, 1, 1, 1, 1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1)) %>% 
  bind_rows() %>%
  group_by(Team, Position) %>% summarise(Mean = mean(Overall))

tr15DF<-cast(tr15_final, Team~Position)


tr02merge<-merge(Winpct02,tr02DF)
tr03merge<-merge(Winpct03,tr03DF)
tr04merge<-merge(Winpct04,tr04DF)
tr05merge<-merge(Winpct05,tr05DF)
tr06merge<-merge(Winpct06,tr06DF)
tr07merge<-merge(Winpct07,tr07DF)
tr08merge<-merge(Winpct08,tr08DF)
tr09merge<-merge(Winpct09,tr09DF)
tr10merge<-merge(Winpct10,tr10DF)
tr12merge<-merge(Winpct12,tr12DF)
tr13merge<-merge(Winpct13,tr13DF)
tr14merge<-merge(Winpct14,tr14DF)
tr15merge<-merge(Winpct15,tr15DF)
trAll<-rbind(tr02merge, tr03merge, tr04merge, tr05merge,
             tr06merge, tr07merge, tr08merge, tr09merge, tr10merge,
             tr12merge, tr13merge, tr14merge, tr15merge)

#Lasso
library(glmnet)
#using 1/3 or so of the sample as test is necessary, see
#http://stats.stackexchange.com/questions/152907/how-do-you-use-test-data-set-after-cross-validation
index<-sample(1:nrow(trAll), nrow(trAll)/5)
trAll_CV<-trAll[-index,]
trAll_test<-trAll[index,]
x <- model.matrix(~C +CB +DT +FB +FS +HB +K +LE +LG +LOLB +LT +MLB +P +QB +RE +RG +ROLB + RT +SS +TE +WR,trAll_CV)[,-1]
#"-1" to exclude the intercept
xm<-as.matrix(data.frame(x))
y=trAll_CV$Winpct
cv.lasso=cv.glmnet(xm,y, nfolds=10) #without specifying nlambda, it is 100 by default
#specify alpha for penalty. It is 1 by default, meaning Lasso instead of Ridge
#lambda.max is not given, but easily computed from the input x and y; it is the 
#smallest value for lambda such that all the coefficients are zero
#value of lambda that gives minimum mean CV error
cv.lasso$lambda.min
coef(cv.lasso, s = "lambda.min")
xtest <- model.matrix(~C +CB +DT +FB +FS +HB +K +LE +LG +LOLB +LT +MLB +P +QB +RE +RG +ROLB + RT +SS +TE +WR,trAll_test)[,-1]
xmtest<-as.matrix(data.frame(xtest))
r2 <- rSquared(trAll_test$Winpct, trAll_test$Winpct - predict(cv.lasso,s = "lambda.min", xmtest))
mse <- mean((trAll_test$Winpct - predict(cv.lasso,s = "lambda.min", xmtest))^2)
#nfolds=10, index<-sample(1:nrow(trAll), nrow(trAll)/5) gives 
#r2=.058, mse=.027
#with coefs: CB: 8.35e-04, LE: 2.21e-05, QB 8.21e-03, SS 7.19e-04, TE 3.97e-04

#nfolds=5, index<-sample(1:nrow(trAll), nrow(trAll)/5) gives 
#r2=.12, mse=.0387 
#with coefs:
#C: .001, QB .007, TE .00028

#random forest
library(randomForest)
library(caret)
library(miscTools)
frmla = Winpct ~ C +CB +DT +FB +FS +HB +K +LE +LG +LOLB +LT +MLB +P +QB +RE +RG +ROLB + RT +SS +TE +WR
fit.rf <- randomForest(frmla, data=trAll_CV, ntree=50)
print(fit.rf)
importance(fit.rf)
cols<-c('C', 'CB', 'DT', 'FB', 'FS', 'HB', 'K', 'LE', 'LG', 'LOLB',
        'LT', 'MLB', 'P', 'QB', 'RE', 'RG', 'ROLB', ' RT', 'SS', 'TE', 'WR')
trAll_testX <- subset(trAll_test, select = -c(Winpct, Team) )
r2 <- rSquared(trAll_test$Winpct, trAll_test$Winpct - predict(fit.rf, trAll_testX))
mse <- mean((trAll_test$Winpct - predict(fit.rf, trAll_testX))^2)
#ntree=50 => r2=.119, mse=.039
#ntree=100 => r2=.086, mse=.040
#ntree=500 => r2=.11, mse=.039
#ntree=1000 => r2=.10,  mse=.039

imp <- data.frame(MDA = sort(fit.rf$importance[,1], decreasing=T) )
imp <- data.frame( Stat = rownames(imp)[1:21], MDA = imp$MDA[1:21])
imp$Stat <- reorder(imp$Stat, -imp$MDA)
ggplot( imp, aes(x = Stat, y = MDA, fill = Stat)) + geom_bar(stat = "identity") +
  scale_y_continuous("Variable Importance", breaks=seq(0,.1,length.out=6), labels=c("0%","2%","4%","6%","8%","10%")) +
  scale_x_discrete("Position") + 
  labs(legend.position = "none")
ggsave( filename = "importance500trees-1.png")


#both Lasso and Random Forest choose LE, TE, QB
