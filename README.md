## Sentiment-Analysis

This is a simple R program to uncover the sentiment behind a collection of Jane Austen's novels. 

# Description

For the senitment analysis I used R and RStudio to write and compile the program. ZThe libraries use are, janaustenr, dpylr, tidyverse, tidytext and wordcloud. After loading in the data from the  janaustenr package, tokenization was performed to remove puncuation as well as splitting the dataset by individual word. The next step is to remove stop word, common words like "a", and "to". After listing the counts of the most common words in the novels senitment analysis is perform with the lexicon "bing". The last portion of the code create a graph of the senitment analysis, and a word cloud based on counts of the tokenized words. 
