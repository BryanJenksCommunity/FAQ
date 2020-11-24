#!/usr/bin/env Rscript

# Install/Attach necessary packages to session
pkgs <- c('tidyverse','tidytext','tokenizers','DiagrammeR','glue')
xfun::pkg_attach2(pkgs)

#===============================================================#
#################### Environmental Variables ####################
vault_path <- '/Users/bryanjenks/Documents/Knowledge'
#===============================================================#

#===============================================================#
####################  Global Variables ####################
total_word_count <- 0
total_file_count <- 0
top_5_words <- 0
chart_string <- ""
aggregate_dataframe <- tibble(word = character())
#===============================================================#

# The actual processing of the text
analyze <- function(files) {
    # For each file in the vault
    for (file in fileNames) {
        words <- read_file(file) %>%
            # remove `[[` and `]]` so the link words are recognized as text too
            gsub("\\[\\[", "", .) %>% 
            gsub("\\]\\]", "", .) %>% 
            gsub("\\n", " ", .) %>% 
            gsub("\\_+", "", .) %>% 
            # tokenize the words
            tokenize_words(strip_punct = TRUE,
                           strip_numeric = TRUE,
                           simplify = TRUE,
                           lowercase = TRUE) %>% 
            # Make the words into a data frame
            unlist() %>% 
            as_tibble()
        # Append result data frame to global data frame i.e. data_frame += 1
        aggregate_dataframe <<- rbind(aggregate_dataframe, words)
    }
}

# Load files from vault
setwd(vault_path) # Sorry Jenny Bryan!
fileNames <-list.files(vault_path, recursive = TRUE, pattern = "*.md")
# fileNames <- Sys.glob('*.md')

# Lets start analyzing!
analyze(fileNames)

# Get a data frame of the aggregation of words and their counts
distinct_words <- aggregate_dataframe %>% 
    count(word = value,name = 'count',sort = TRUE) 

# Remove the stop words
stop_words_removed <- distinct_words %>% 
    anti_join(stop_words, by = c('word' = 'word')) 



# 'bing' is better for binary sentiment
# but 'nrc' produces nicer visuals 🤷
sentiments <- get_sentiments("nrc") 

# Take initial raw aggregate column of words (with dupes)
word_sentiments <- aggregate_dataframe %>%
    # Add sentiments to the data frame
    left_join(sentiments, by = c('value' = 'word')) %>% 
    # Any missing sentiment words are removed
    filter(!is.na(sentiment)) %>% 
    # Select only the columns we need
    select(sentiment) %>% 
    # count frequency of sentiments
    count(sentiment)

# word_sentiments <- summarise_at(group_by(word_sentiments,sentiment),vars(counts),funs(sum(.,na.rm=TRUE)))

# Get the values for each sentiment into vector for subset assignment
nums <- word_sentiments[[2]]

# Assign each sentiment its value count
anger <- nums[1]
anticipation <- nums[2]
disgust <- nums[3]
fear <- nums[4]
joy <- nums[5]
negative <- nums[6]
positive <- nums[7]
sadness <- nums[8]
surprise <- nums[9]
trust <- nums[10]

#======================================================#
# GLOBAL VAR -- Assign total word count
total_word_count <- length(aggregate_dataframe[[1]])

# GLOBAL VAR -- Assign top 5 words minus stop words
top_5_words <- stop_words_removed %>% 
    slice_max(count, n = 5)
word_5 <- top_5_words[[1]]
count_5 <- top_5_words[[2]]

# GLOBAL VAR -- Count of files
total_file_count <- length(fileNames)

# GLOBAL VAR --Result Chart
chart_string <- glue("```mermaid
pie title Vault Sentiment
\"anger\": {anger}
\"anticipation\": {anticipation}
\"disgust\": {disgust}
\"fear\": {fear}
\"joy\": {joy}
\"negative\": {negative}
\"positive\": {positive}
\"sadness\": {sadness}
\"surprise\": {surprise}
\"trust\": {trust}
```")
#======================================================#

# Create the presentation string of what actually gets written to the file
# and displayed in Obsidian
output_string <- glue("
# Vault Analysis

## Stats

**File Count:** {total_file_count}
**Word Count:** {total_word_count}
**Top 5 Words:**

| Word | Frequency |
|:----|:-----------|
| {word_5[1]} | {count_5[1]} |
| {word_5[2]} | {count_5[2]} |
| {word_5[3]} | {count_5[3]} |
| {word_5[4]} | {count_5[4]} |
| {word_5[5]} | {count_5[5]} |

## Visualization

{chart_string}
")

fileConn<-file("Vault Stats.md")
writeLines(output_string, fileConn)
close(fileConn)
