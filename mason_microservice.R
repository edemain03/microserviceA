# Masons Microservice
# Using text files and picsum image gen api

library(httr)

setwd("C:/Users/ellio/OneDrive/Desktop/CS 361/Masons Microservice")

base_url <- "https://picsum.photos/"

while (TRUE) {
  dirs <- read.csv("request.csv")
  if (dirs$RUN == "TRUE") {
    grey <- dirs$greyScale
    
    blur <- dirs$blur
    
    greyScale <- NULL
    
    if (grey == "TRUE") {
      greyScale <- TRUE
    } else {
      greyScale <- FALSE
    }
    
    x <- dirs$x_size
    
    y <- dirs$y_size
    
    if (greyScale == TRUE & blur != 0)  {
      base_url <- paste0(base_url, x, "/", y, "/", "?grayscale&blur=", blur)
    } else if (greyScale == TRUE & blur == 0) {
      base_url <- paste0(base_url, x, "/", y, "/", "?grayscale")
    } else if (greyScale == FALSE & blur != 0) {
      base_url <- paste0(base_url, x, "/", y, "/", "?blur=", blur)
    } else {
      base_url <- paste0(base_url, x, "/", y, "/")
    }
    
    dirs$URL <- base_url
    
    base_url <- "https://picsum.photos/"
    
    dirs$RUN <- "FALSE"
    
    print(dirs)
    write.csv(dirs, "request.csv")
  }
}



