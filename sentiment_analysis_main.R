###sentiment analysis

#keys and tokens are available in the app setting of the twitter app

#these keys are necessary to connect the r with twitter and extract the tweets

Consumer_API_Key ="KC1ssaTGFimytjI8CO9NQ72q7"

Consumer_API_Secret="X1oNWVg2oYvC7YEWR8REHkL8Qupg6Mm6jr7uoBT4j1nYL6V7mr"

Access_Token ="751247338014859264-Sw0tsXnVFIodHP78JwcmI1If2q880WE"

Access_Token_Secret ="cLKsEXAGhMvpXTsUIKBRZvo3oBDuTUBC98UMX0bgD99vG"

#package contains connections to connect to twitter account 
library(twitteR)

#connecting to twitter account 
setup_twitter_oauth(Consumer_API_Key, Consumer_API_Secret, Access_Token, Access_Token_Secret)

#choose direct authentication and run the above code again which is given   below
setup_twitter_oauth(Consumer_API_Key, Consumer_API_Secret, Access_Token, Access_Token_Secret)

#searches twitter for the word abortion and takes a sample of 1500 tweets
data = searchTwitteR("#france vs croatia",n=1500)

#gives you the no of tweets inside the list
length(data)

#to get the text out of the tweets
data.text = lapply(data,function(t)t$getText())

#to view the text
data.text

library(plyr)
library(stringr)

#scan the positive words file and read all the positive characters
pos.words = scan('positive-words.txt',what = 'character',comment.char = ';')

#scan the negative words file and read all the negative characters
neg.words = scan('negative-words.txt',what = 'character',comment.char = ';')

#this file contains score.sentiment function
source('sentiment_new.R')

#scoring our tweets 
analysis = score.sentiment(data.text,pos.words,neg.words)

#table gives the emotion levels for the above word
table(analysis$score)
