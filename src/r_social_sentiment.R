# This is a basic r script to do sentiment analysis of the unniest amazon review I could find. Largely sourced from https://www.kaggle.com/rtatman/tutorial-sentiment-analysis-in-r
# But fitted to work on the amazon review. Used to practice sentiment analysis for a larger project (Link)

#install.packages("tidyverse", repos="https://ftp.osuosl.org/pub/cran/")

# load in the libraries we'll need
library(tidyverse)
library(tidytext)
#library(glue)
#library(stringr)

#ostive
# sentiment words, negative sentiment words, the difference & the normalized difference
GetSentiment <- function(review){
	# get the file
	#fileName <- glue("../input/", file, sep = "")
	# get rid of any sneaky trailing spaces
	review <- trimws(review)

	# read in the new file
	#fileText <- glue(read_file(f))
	# remove any dollar signs (they're special characters in R)
	#fileText <- gsub("\\$", "", fileText)

	# tokenize
	tokens <- tibble(text = review) %>% unnest_tokens(word, text)

	# get the sentiment from the first text:
	print(tokensddd)ddd
	sentiment <- tokens %>%
		inner_join(get_sentiments("bing")) %>% # pull out only sentimen words
		count(sentiment) %>% # count the # of positive & negative words
			spread(sentiment, n, fill = 0) %>% # made data wide rather than narrow
				mutate(sentiment = positive - negative) %>% # # of positive words - # of negative owrds
					#mutate(file = file) %>% # add the name of our file
					#mutate(year = as.numeric(str_match(file, "\\d{4}"))) %>% # add the year
					#mutate(president = str_match(file, "(.*?)_")[2]) # add president

					# return our sentiment dataframe
					print(sentiment)
					return(sentiment)
}

review <- "What can I say about the 571B Banana Slicer that hasn't already been said about the wheel, penicillin, or the iPhone.... this is one of the greatest inventions of all time. My husband and I would argue constantly over who had to cut the days banana slices. It's one of those chores NO ONE wants to do! You know, the old I spent the entire day rearing OUR children, maybe YOU can pitch in a little and cut these bananas? and of course, You think I have the energy to slave over your damn bananas? I worked a 12 hour shift just to come home to THIS?! These are the things that can destroy an entire relationship. It got to the point where our children could sense the tension. The minute I heard our 6-year-old girl in her bedroom, re-enacting our daily banana fight with her Barbie dolls, I knew we had to make a change. That's when I found the 571B Banana Slicer. Our marriage has never been healthier, AND we've even incorporated it into our lovemaking. THANKS 571B BANANA SLICER!\n"

GetSentiment(review)
