## STAT 355 PROJ

#had to install stringr package to deal with dates

## Some useful info :
## teams play same amount games field and turf
## any head injury/uncomfortability considered a head injury which is immediately considered a concussion by nfl protocol
## certainty of concussion represented by the reported injury
## does not specify special teams players, but the majority of special teams players play either wide recievers, safety, corner,and some linebackers/fullbacks

#Part1 ---------------------------------------------------------

nflData <- read.csv("NFL_Concussion_Injuries_2012-2014.csv")
nflData
head(nflData)
d <- read.csv("NFL_2009-2017.csv")

fieldData <- d[131594:270583,c(1,2,72,73)]
#used excel to figure out dates to rows needed 
HAdata<-fieldData[!duplicated(fieldData[c('GameID')]), ]
HAdata
(unique(HAdata$HomeTeam))
nflData$OppTeam <- c('NA')
nflData$fieldType <- c('NA')
nflData$fieldType <- c('NA')
typeof(nflData$Date)
nflData[nflData$Opposing.Team == 'Tampa Bay Buccaneers',]$OppTeam <- 'TB'
nflData[nflData$Opposing.Team == 'Atlanta Falcons',]$OppTeam <- 'ATL'
nflData[nflData$Opposing.Team == 'New York Giants',]$OppTeam <- 'NYG'
nflData[nflData$Opposing.Team == 'Cleveland Browns',]$OppTeam <- 'CLE'
nflData[nflData$Opposing.Team == 'Washington Redskins',]$OppTeam <- 'WAS'
nflData[nflData$Opposing.Team == 'Oakland Raiders',]$OppTeam <- 'OAK'
nflData[nflData$Opposing.Team == 'Kansas City Chiefs',]$OppTeam <- 'KC'
nflData[nflData$Opposing.Team == 'Seattle Seahawks',]$OppTeam <- 'SEA'
nflData[nflData$Opposing.Team == 'Green Bay Packers',]$OppTeam <- 'GB'
nflData[nflData$Opposing.Team == 'New York Jets',]$OppTeam <- 'NYJ'
nflData[nflData$Opposing.Team == 'San Diego Chargers',]$OppTeam <- 'SD'
nflData[nflData$Opposing.Team == 'Arizona Cardinals',]$OppTeam <- 'ARI'
nflData[nflData$Opposing.Team == 'Chicago Bears',]$OppTeam <- 'CHI'
nflData[nflData$Opposing.Team == 'Cincinnati Bengals',]$OppTeam <- 'CIN'
nflData[nflData$Opposing.Team == 'St. Louis Rams',]$OppTeam <- 'STL'       
nflData[nflData$Opposing.Team == 'Detroit Lions',]$OppTeam <- 'DET'
nflData[nflData$Opposing.Team == 'Indianapolis Colts',]$OppTeam <- 'IND'
nflData[nflData$Opposing.Team == 'New England Patriots',]$OppTeam <- 'NE'           
nflData[nflData$Opposing.Team == 'Pittsburgh Steelers',]$OppTeam <- 'PIT'
nflData[nflData$Opposing.Team == 'Baltimore Ravens',]$OppTeam <- 'BAL'
nflData[nflData$Opposing.Team == 'Miami Dolphins',]$OppTeam <- 'MIA'                
nflData[nflData$Opposing.Team == 'Jacksonville Jaguars',]$OppTeam <- 'JAC'
nflData[nflData$Opposing.Team == 'New Orleans Saints',]$OppTeam <- 'NO'
nflData[nflData$Opposing.Team == 'Minnesota Vikings',]$OppTeam <- 'MIN'
nflData[nflData$Opposing.Team == 'Philadelphia Eagles',]$OppTeam <- 'PHI'
nflData[nflData$Opposing.Team == 'Houston Texans',]$OppTeam <- 'HOU'
nflData[nflData$Opposing.Team == 'Denver Broncos',]$OppTeam <- 'DEN'
nflData[nflData$Opposing.Team == 'Tennessee Titans',]$OppTeam <- 'TEN'
nflData[nflData$Opposing.Team == 'Buffalo Bills',]$OppTeam <- 'BUF'
nflData[nflData$Opposing.Team == 'Carolina Panthers',]$OppTeam <- 'CAR'
nflData[nflData$Opposing.Team == 'San Francisco 49ers',]$OppTeam <- 'SF'
nflData[nflData$Opposing.Team == 'Dallas Cowboys',]$OppTeam <- 'DAL'

nflData[nflData$Team == 'Tampa Bay Buccaneers',]$fieldType <- 'TB'
nflData[nflData$Team == 'Atlanta Falcons',]$fieldType <- 'ATL'
nflData[nflData$Team == 'New York Giants',]$fieldType <- 'NYG'
nflData[nflData$Team == 'Cleveland Browns',]$fieldType <- 'CLE'
nflData[nflData$Team == 'Washington Redskins',]$fieldType <- 'WAS'
nflData[nflData$Team == 'Oakland Raiders',]$fieldType <- 'OAK'
nflData[nflData$Team == 'Kansas City Chiefs',]$fieldType <- 'KC'
nflData[nflData$Team == 'Seattle Seahawks',]$fieldType <- 'SEA'
nflData[nflData$Team == 'Green Bay Packers',]$fieldType <- 'GB'
nflData[nflData$Team == 'New York Jets',]$fieldType <- 'NYJ'
nflData[nflData$Team == 'San Diego Chargers',]$fieldType <- 'SD'
nflData[nflData$Team == 'Arizona Cardinals',]$fieldType <- 'ARI'
nflData[nflData$Team == 'Chicago Bears',]$fieldType <- 'CHI'
nflData[nflData$Team == 'Cincinnati Bengals',]$fieldType <- 'CIN'
nflData[nflData$Team == 'St. Louis Rams',]$fieldType <- 'STL'       
nflData[nflData$Team == 'Detroit Lions',]$fieldType <- 'DET'
nflData[nflData$Team == 'Indianapolis Colts',]$fieldType <- 'IND'
nflData[nflData$Team == 'New England Patriots',]$fieldType <- 'NE'           
nflData[nflData$Team == 'Pittsburgh Steelers',]$fieldType <- 'PIT'
nflData[nflData$Team == 'Baltimore Ravens',]$fieldType <- 'BAL'
nflData[nflData$Team == 'Miami Dolphins',]$fieldType <- 'MIA'                
nflData[nflData$Team == 'Jacksonville Jaguars',]$fieldType <- 'JAC'
nflData[nflData$Team == 'New Orleans Saints',]$fieldType <- 'NO'
nflData[nflData$Team == 'Minnesota Vikings',]$fieldType <- 'MIN'
nflData[nflData$Team == 'Philadelphia Eagles',]$fieldType <- 'PHI'
nflData[nflData$Team == 'Houston Texans',]$fieldType <- 'HOU'
nflData[nflData$Team == 'Denver Broncos',]$fieldType <- 'DEN'
nflData[nflData$Team == 'Tennessee Titans',]$fieldType <- 'TEN'
nflData[nflData$Team == 'Buffalo Bills',]$fieldType <- 'BUF'
nflData[nflData$Team == 'Carolina Panthers',]$fieldType <- 'CAR'
nflData[nflData$Team == 'San Francisco 49ers',]$fieldType <- 'SF'
nflData[nflData$Team == 'Dallas Cowboys',]$fieldType <- 'DAL'

nflData[nflData$HomeTeam == 'TB',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'ATL',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'NYG',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'CLE',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'WAS',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'OAK',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'KC',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'SEA',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'GB',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'NYJ',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'SD',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'ARI',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'CHI',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'CIN',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'STL',]$fieldType <- 'TURF'       
nflData[nflData$HomeTeam == 'DET',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'IND',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'NE',]$fieldType <- 'TURF'           
nflData[nflData$HomeTeam == 'PIT',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'BAL',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'MIA',]$fieldType <- 'GRASS'                
nflData[nflData$HomeTeam == 'JAC',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'NO',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'MIN',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'PHI',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'HOU',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'DEN',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'TEN',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'BUF',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'CAR',]$fieldType <- 'TURF'
nflData[nflData$HomeTeam == 'SF',]$fieldType <- 'GRASS'
nflData[nflData$HomeTeam == 'DAL',]$fieldType <- 'TURF'

colnames(HAdata)[colnames(HAdata) == 'ï..Date'] <- 'Date'
HAdata
nflData

install.packages("stringr")
library(stringr)
nflData$Date <- str_replace_all(nflData$Date,"/","-")

HAdata$Date <- as.Date(HAdata$Date, "%Y-%m-%d")
nflData$Date <- as.Date(nflData$Date, "%d/%m/%Y")

nflData$HomeTeam <- c('NA')
nflData$AwayTeam <- c('NA')

for (i in 1:length(nflData$Date)) {
    for (j in 1:length(HAdata$Date)) {
      if (nflData$Date[i] == HAdata$Date[j]) {
        if (HAdata$HomeTeam[j] == nflData$fieldType[i]) {
          nflData$HomeTeam[i] <- nflData$fieldType[i]
          nflData$AwayTeam[i] <- nflData$OppTeam[i]
        }
        else if (HAdata$AwayTeam[j] == nflData$fieldType[i]) {
          nflData$AwayTeam[i] <- nflData$fieldType[i]
          nflData$HomeTeam[i] <- nflData$OppTeam[i]
        }
      }
    }
}
nflData

nflData$Date[1] == HAdata$Date[77]
nflData[nflData$ID=='Garrett Graham - Houston Texans vs. Cincinnati Bengals (5/1/2013)',]$HomeTeam <- 'HOU'
nflData[nflData$ID=='LaRon Landry - Indianapolis Colts vs. Kansas City Chiefs (4/1/2014)',]$HomeTeam <- 'IND'
nflData[nflData$ID=='Josh McNary - Indianapolis Colts vs. Kansas City Chiefs (4/1/2014)',]$HomeTeam <- 'IND'
nflData[nflData$ID=='Percy Harvin - Seattle Seahawks vs. New Orleans Saints (11/1/2014)',]$HomeTeam <- 'SEA'
nflData[nflData$ID=='Anthony Allen - Baltimore Ravens vs. Denver Broncos (12/1/2013)',]$HomeTeam <- 'DEN'
nflData[nflData$ID=='Gino Gradkowski - Baltimore Ravens vs. Denver Broncos (12/1/2013)',]$HomeTeam <- 'DEN'       



concData <- nflData[,c(2,22,7,10,13,17,20,23,15)]
concData
# combined data from the nfl concussion injuries data with the play by play data from the nfl
# going from 2009-20017. I needed the play by play data because it gave me the home and away team data that I would use 
# to make the field type column. My final table, concDATA, gave me the date of the concussion, the player, the team they were
# on at the time, their position, the week of the injury, the number of games missed, play time after injury, the home team,
# the field type, and the reported injury type

unique(concData$Reported.Injury.Type)
attach(concData)
typeof(Games.Missed)
unique(Games.Missed)
unique(Play.Time.After.Injury)
unique(Reported.Injury.Type)
unique(Position)
levels(factor(Position))
sum(is.na(Games.Missed))       
length(Games.Missed)
unique(is.na(gmData))

gmData <- concData[!is.na(Games.Missed),]
mean(gmData$Games.Missed)
#the average amount of games missed after a concussion in the NFL from 2012-2014 
# was 0.9252078
(gmData$Games.Missed)
#and it is very obvious looking at the data that the mode for games missed surprisingly is 0
table(nflData$Position)
#Center        Comerback    Defensive End Defensive Tackle        Full Back            Guard       Linebacker     Long Snapper Offensive Tackle      Quarterback     Running Back           Safety        Tight End 
#7               64               20               13                3               26               37                1               22               14               39               51               39 
#Wide Receiver 
#56 
#number of concussions by reciever

par(mfrow = c(1,1 ))

plot(table(nflData$Position))
#can clearly see that certain positions record more concussions than others, not an even distribution

plot(table(nflData$HomeTeam))
#can clearly see that some fields/home teams record more concussions than others, not an even distribution

max(table(nflData$Player))
#most amount of concussions from a single player from 2012 -2014 is 3
table((table(nflData$Player)) == 3)
# 7 players with 3 concussions!! in 3 seasons!!

table(nflData$HomeTeam)
#colder areas have more concussions?

# Part2 ---------------------------------------------------------------------------------------------

#---------------------------------------------------------------------
# Question 1 - were there more concussions on grass fields or turf fields?
table(nflData$fieldType)
#initial thought of turf, leading to concussions
prop.test(188,392)
# running  a proportion test on the number of grass fields vs turf fields,shows more grass than turf concussions from 2012 to 2014 in the NFL
# and gave p-value = 0.4487 meaning there is little to no difference, which is evident by the table of the field types showing 204 grass concussions
# and 188 turf concussions. This method is appropriate because the field types column is being treated as a binomial, with only two possibilities,
# grass or turf
#---------------------------------------------------------------------
# Question2 - any affect/ relationship between the players position and the field type
pos <- glm(factor(fieldType) ~ Position , family = binomial)
# the baseline is the center position, and the coefficient results from glm represents the change in odds of turf vs grass for that position, 
#relative to the baseline, which is the center position
summary(pos)
#only significance is with the quarterback
unique(factor(fieldType))
pos$coefficients
qbData <- concData[Position == "Quarterback",]
qbData
#can see that the vast majority of quarterback concussions happened on grass fields, and that the reported injury type was concussion
#and based on the NFL concussion protocol, they were certain the player had a concussion
par(mfrow = c(2, 2))
plot(pos)
# trying to check assumptions, seemed a little weird but I know based off my conversations with Dr.Keaton that I am doing a 
# different kind of analysis with the categorical variable, the Q-Q plot is technically a straight line but has a slope of 1
#---------------------------------------------------------------------
# Question3 - is there a significance in the field type as it relates to concussions?
gmData <- concData[!is.na(Games.Missed),]

gmData[gmData$fieldType == 'GRASS',]$Games.Missed
gmData[gmData$fieldType == 'TURF',]$Games.Missed

t.test(gmData[gmData$fieldType == 'GRASS',]$Games.Missed, gmData[gmData$fieldType == 'TURF',]$Games.Missed ,alternative = 'two.sided')
# p-value of 0.3991, which is greater than the alpha value of 0.05, meaning there is little difference between grass and turf 
# this test meets all assumptions, grassa and turf have a fairly normal distribution
#------------------------------------------------------------------------------------
# Question4 - what if I add an interaction between the Games Missed and the Position Played?
pos_gm <- glm(factor(gmData$fieldType) ~ gmData$Position * gmData$Games.Missed , family = binomial)
summary(pos_gm)
# doing something similar to the first test I did, but now adding an interaction between the players position and the Games missed from the concussion
# can see from the summary that the AIC value has gone down, showing a better fit for the model, and also showed less significance in the quarterback position
par(mfrow = c(2, 2))
plot(pos_gm)
# checking the assumptions, looks much better than the original glm I did in my first question, my qq plot seems a lot more resonable, but not as straight,
# but still follows a linear pattern

# some questions this project made me continue asking....
typeof(Games.Missed)
unique(Games.Missed)
unique(Play.Time.After.Injury)
unique(Reported.Injury.Type)
##later in season more likely to get concussion???
unique(Position)
levels(factor(Position))
sum(is.na(Games.Missed))       
length(Games.Missed)
unique(is.na(gmData))
#maybe shows head to head contact more likely to cause concussions than act of hitting the ground in the NFL
