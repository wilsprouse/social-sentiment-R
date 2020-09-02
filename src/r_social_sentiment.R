# This is a basic r script to do sentiment analysis of the unniest amazon review I could find. Largely sourced from https://www.kaggle.com/rtatman/tutorial-sentiment-analysis-in-r
# But fitted to work on the amazon review. Used to practice sentiment analysis for a larger project (Link)

#install.packages("tidyverse", repos="https://ftp.osuosl.org/pub/cran/")

suppressPackageStartupMessages(library(readr))
suppressPackageStartupMessages(library(dplyr))
suppressPackageStartupMessages(library(ggplot2))
suppressPackageStartupMessages(library(tidyverse))


# load in the libraries we'll need
library(tidyverse)
library(tidytext)
#library(glue)
#library(stringr)

#ostive
# sentiment words, negative sentiment words, the difference & the normalized difference
GetSentiment <- function(review){

	# Trim the input
	review <- trimws(review)


	# Data Frame
	data_frame <- tibble(text = review) %>% unnest_tokens(word, text)

	# get the sentiment from the input
	sentiment <- data_frame %>%
		inner_join(get_sentiments("bing")) %>% # pull out only sentimen words
		print(sentiment)

		count(sentiment) %>% # count the # of positive & negative words
			#print(sentiment)
			spread(sentiment, n, fill = 0) %>% # made data wide rather than narrow
				mutate(sentiment = positive - negative) # # of positive words - # of negative owrds
				#print(sentiment)

	# return our sentiment dataframe
	return(sentiment)
}

review <- "What can I say about the 571B Banana Slicer that hasn't already been said about the wheel, penicillin, or the iPhone.... this is one of the greatest inventions of all time. My husband and I would argue constantly over who had to cut the days banana slices. It's one of those chores NO ONE wants to do! You know, the old I spent the entire day rearing OUR children, maybe YOU can pitch in a little and cut these bananas? and of course, You think I have the energy to slave over your damn bananas? I worked a 12 hour shift just to come home to THIS?! These are the things that can destroy an entire relationship. It got to the point where our children could sense the tension. The minute I heard our 6-year-old girl in her bedroom, re-enacting our daily banana fight with her Barbie dolls, I knew we had to make a change. That's when I found the 571B Banana Slicer. Our marriage has never been healthier, AND we've even incorporated it into our lovemaking. THANKS 571B BANANA SLICER!\n"


msft_news <- "[['\'\\nThe Consumer Technology Association, which represents companies like IBM (IBM), Microsoft (MSFT) and Sony (SNE), also blasted the effort, saying it would \'make compliance all but impossible'], ['\'\\nThe Consumer Technology Association, which represents\\ncompanies like IBM (IBM), Microsoft (MSFT) and Sony (SNE)\\n, also blasted the effort, saying it would \'make\\ncompliance all but impossible'], [], ['\\nBRUSSELS (Reuters) - The pressure from the COVID-19 pandemic on government finances might help bring about a stalled international agreement on how to tax digital giants like Google, Amazon (AMZN), Facebook (FB), Apple (AAPL) or Microsoft (MSFT), German Finance Minister Olaf Sholz said on Wednesday'], ['\\nBRUSSELS, Sept 2 (Reuters) - The pressure from the COVID-19\\npandemic on government finances might help bring about a stalled\\ninternational agreement on how to tax digital giants like\\nGoogle, Amazon (AMZN) , Facebook (FB) , Apple (AAPL)\\nor Microsoft (MSFT), German Finance Minister Olaf\\nSholz said on Wednesday'], '\\nSept 2 (Reuters) - Hon Hai Precision Industry Co Ltd\\n:\\n* SAYS IT AND MICROSOFT CORP HAVE AGREED TO\\nWITHDRAW LAW\\nSUITS IN CALIFORNIA\\n* SAYS IT AND MICROSOFT AGREE TO BUILD MORE CONSTRUCTIVE\\nPARTNERSHIP\\nSource text in Chinese:\\nFurther company coverage:\\n(Reporting by Hong Kong newsroom)\\n', [\'\\nShares of Microsoft Corp (MSFT), Walmart Inc (WMT) and\\nOracle Corp (ORCL) - all suitors for TikTok's U\'], [\'\\nShares of Microsoft Corp (MSFT), Walmart Inc (WMT) and\\nOracle Corp (ORCL) - all suitors for TikTok's U\'], [\'\\nShares of Microsoft Corp (MSFT), Walmart Inc (WMT) and\\nOracle Corp (ORCL) - all suitors for TikTok's U\'], [' assets, Microsoft Corp (MSFT),\\nWalmart Inc (WMT) and Oracle Corp (ORCL), dropped between\\n0'], [' assets, Microsoft Corp (MSFT),\\nWalmart Inc (WMT) and Oracle Corp (ORCL), dropped between\\n1'], [' assets, Microsoft Corp (MSFT),\\nWalmart Inc (WMT) and Oracle Corp (ORCL), dropped between\\n0'], [\' suitors Microsoft Corp (MSFT), Oracle Corp (ORCL) and Walmart Inc (WMT) fell on Monday after China's move to restrict some technology exports spurred worries Beijing might block any deal for the video app's U\', '\\nShares of Walmart (WMT), Microsoft (MSFT) and Oracle fell between 1% and 2'], [' assets, Microsoft Corp (MSFT),\\nWalmart Inc (WMT) and Oracle Corp (ORCL), dropped between\\n2'], [], [' (MSFT), Walmart Inc', '\\n     Microsoft (MSFT) and Walmart (WMT) have been working together, and Oracle also has been joined by ByteDance investors General\\nAtlantic, Sequoia Capital and Coatue Management LLC'], [' Meanwhile, the S&P 500 hit record highs, powered by\\nAmazon (AMZN), Microsoft (MSFT) and Apple (AAPL) in a rally that has accentuated the\\ndivide between the blistering stock market and a still-badly\\ndamaged U'], [], [' (MSFT), Walmart Inc', '\\n     Microsoft (MSFT) and Walmart (WMT) have been working together, and Oracle also has been joined by ByteDance investors General\\nAtlantic, Sequoia Capital and Coatue Management LLC'], [' (MSFT), Walmart Inc', '\\n     Microsoft (MSFT) and Walmart (WMT) have been working together, and Oracle has also been joined by ByteDance investors General\\nAtlantic, Sequoia Capital and Coatue Management LLC']]\n"

GetSentiment(review)
