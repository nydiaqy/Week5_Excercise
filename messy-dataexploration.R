# the following exercises are a test in disguise. 
# can you think of any improvements to the following code?
# go through the exercises and answer them while fixing issues and improving on code workflow
# make a Rmarkdown (or Quarto) version of this document with your responses 
# render the document in PDF and HTML formats

rm(list=ls()) 

 install.packages("tidyverse") 
 

library(tidyverse)

## PROBLEM 1 ##

visualizing your data is important!
summary statistics can be highly misleading, and simply plotting the data can reveal a lot more!
Lets look at the Anscombe’s Quartet data. There are four different data sets.
Anscombe, F. J. (1973). "Graphs in Statistical Analysis". American Statistician. 27 (1): 17–21. doi:10.1080/00031305.1973.10478966. JSTOR 2682899.

anscombe_quartet = readRDS("anscombe quartet.rds")

# let's explore the dataset 
str(anscombe_quartet)

# what does the function str() do? 

summarise the data 

# let's check some summary statistics:

anscombe_quartet %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  )

# what do the summary statistics tell us about the different datasets? 
They have dif distribution

# let's plot the data with ggplot:

require(ggplot2)

 ggplot(anscombe_quartet, aes(x=x,y=y)) +
  geom_point() + 
  geom_smooth(method = "lm",formula = "y ~ x") +
  facet_wrap(~dataset)


# save as plot - PNG format
# width 5 inch, height = 5 inch for paper


# what do the plots tell us about the different datasets? 
# describe the relationship between x and y in the different datasets. 
The first data set is more linear regression. The second is a projection. Third one has an outlier. Fourth one has an outlier around 20 and the rest is around 6
# would linear regression be an appropriate statistical model to analyse the x-y relationship in each dataset?
nope. Only 1. 
# what conclusions can you draw for the plots and summary statistics? 
Dont judge from its cover



## PROBLEM 2 ##

#(adapt code from problem 1 if encessary)

# load in the datasaurus dataset
datasaurus_dozen = readRDS("datasaurus_dozen.rds")

# explore the different datasets in datasaurus_dozen 
datasaurus_dozen %>% 
  group_by(dataset) %>% 
  summarise(
    mean_x    = mean(x),
    mean_y    = mean(y),
    min_x     = min(x),
    min_y     = min(y),
    max_x     = max(x),
    max_y     = max(y),
    crrltn    = cor(x, y)
  )

# print descriptive statistics and make a nicely formatted table
str(datasaurus_dozen)

# calculate the correlations for x and y

# Plot their relationships including the line of best fit.

# save the plot 

