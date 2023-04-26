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

## Matching Discussion Partner Data
...

## Featurizing and Summarizing Chat Content
...
