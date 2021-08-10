library(janeaustenr)
library(dplyr)
library(tidyverse)
library(tidytext)
library(wordcloud)


#load all the data
df <- janeaustenr::austen_books() %>%
  group_by(book) %>%
  mutate(
    linenumber = row_number()
  )


#performing toeknization per word and creating a tibble data frame 
token <- df %>% 
  ungroup() %>%
  unnest_tokens(word, text)

#remove all the stop words using 
data("stop_words")

token <- token %>%
  anti_join(stop_words)

#tracking the most common words in all Jane Austen book within the data-set
token %>% 
  ungroup() %>% 
  count(word, sort=TRUE) 
 

#creating the sentiment for each of the tokens in the list of words 
sentiment <- token %>%
  inner_join(get_sentiments("bing")) %>%
  count(book, index=linenumber %/% 50, sentiment) %>%
  pivot_wider(names_from = sentiment, values_from = n, values_fill = 0) %>% 
  mutate(sentiment = positive - negative)


#plotting out the sentiment analysis using ggplot
ggplot(sentiment, aes(index, sentiment, fill = book)) +
  geom_col(show.legend = FALSE) +
  facet_wrap(~book, ncol = 2, scales = "free_x")

#creating a word cloud of the counts of words 
token %>%
  anti_join(stop_words) %>%
  count(word) %>%
  with(wordcloud(word, n, max.words = 100))
