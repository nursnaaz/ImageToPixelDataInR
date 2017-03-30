#Clear the Environment
rm(list=ls(all.names=TRUE))

#Set the Path
setwd("C:/Users/mohamed.noordeen/Downloads/Train_HI6auGp/Train/Train_Images/")

#Load the library
#install.packages("png") #download if not there
library("png")

#Reading .png . Change the format what  ever you want
type <- ".png"
f <- list.files(pattern=type)
tot <- length(f)-1

datac <- data.frame()

#Iterating each image file and saving pixel rate as a row for each column
for(num in 0:tot){
  pic <- paste0(num,".png")
  print(paste(pic))
  x <- readPNG(pic)
  a <- as.vector(x)
  dataf <- data.frame(a)
  if(num==0)
    datac <- rbind(datac,dataf)
  else
    datac <- cbind(datac,dataf)
}

#Transposing the data frame to make each image data is each row
df.train <- as.data.frame(t(datac))

setwd("C:/Users/mohamed.noordeen/Downloads/Train_HI6auGp/Train/")
#Reading the file for adding labelto each row
data_train <- read.csv("traincsv.csv")

#appending the label  data to pixel data frame
df.train <- cbind(df.train,data_train$label)

#Writing the data in filesystem
write.csv(x = df.train, file = "train_preprocessed.csv")