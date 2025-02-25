
<!-- README.md is generated from README.Rmd. Please edit that file -->

# Masons Microservice

<!-- badges: start -->
<!-- badges: end -->

How to request data: To request data, the user should have a csv file in
their working directory named request.csv. This file should have the
following columns: greyScale, RUN, x_size, y_size, and blur. The user
should set RUN to TRUE to request a new image. The user should set
greyScale to TRUE if they want the image to be in grayscale. The user
should set x_size and y_size to the desired dimensions of the image If
only one is selected, the program will return a square image of that
size. The user should set blur to the desired amount of blur (0-10). The
user should set RUN to TRUE in order when they are ready to request a
new image. An example call using R could look like the following.

``` r
data <- read.csv("request.csv")

data$greyScale <- "False"
data$blur <- 2
data$x_size <- 200
data$y_size <- 200
data$RUN <- "TRUE"

print(data)
#>   X.1 X greyScale blur x_size y_size  RUN
#> 1   1 1     False    2    200    200 TRUE

write.csv(data, "request.csv")
```

They developer of the main program should create a function that fills
out these fields based on their needs.

To Receive Data: To receive the image the user will reopen the csv file,
and there will be a URL field that will contain the URL of the image.
The user can then use this URL to display the image.

UML Sequence Diagram: ![UML Sequence Diagram](UML%20diagram.png)
