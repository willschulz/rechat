# rechat
This R package provides useful functions for parsing and working with data from the rechat online chat platform.

# Installation
The package can be installed from this repo, using the following code:

``` r
# install.packages("devtools")
devtools::install_github("willschulz/rechat")
library(rechat)
```

# Getting Started
To get started, create a ReChat account at https://reso.chat/ and follow the instructions for running a study.

## Parsing Chat Data
When you download chat data from your ReChat study, it would be in the form of a csv file.  The following code will read this file into R and convert it to an R list:

``` r
chat_data <- parseChat("path/to/downloaded_file.csv")
```

## Featurizing and Summarizing Chat Content
Users can conduct content analysis of chats by using the `featurizeChat` and `summarizeChat` functions, which can be used to apply any function to featurize chats at the message level, and summarize those features at the participant level, respectively.

### Character Count
For example, we might want to summarize participants' loquaciousness by counting the number of characters they wrote during the chat.  We can augment the `chat_data` with a message-level character count with the following code:

``` r
chat_data_featurized <- featurizeChat(chat_data, featurization_function = nchar)
```

Then, we can summarize character count at the participant level, and append a `char_count` variable to a dataframe `survey_data` using the following code:

``` r
survey_data <- summarizeChat(survey_data, chat_data, chat_feature_name = "nchar", summary_function = sum, na.rm = T, summary_feature_name = "char_count")
```

Note that in order to merge chat data to survey data, the survey should require participants to enter their chat completion code into a free-text box, and this survey variable should be named `receiptCode`.

## Matching Discussion Partner Data
When you download chat data from your ReChat study, it would be in the form of a csv file.  The following code will read this file into R and convert it to an R list:

``` r
chat_data <- parseChat("path/to/downloaded_file.csv")
```

