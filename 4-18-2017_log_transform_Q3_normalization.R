# 	4-18-2017

# 	R script to log2 transform and Q3 normalize small RNA seq count data
#	Adding +1 to all counts to avoid 0 count issues for log transformation
#	Using edgeR package to carry out third quartile normalization on count data
#	Exporting data in both log2 tranformed, and log2 tranformed + Q3 normalized formats

file.choose()
setwd("/home/mhunt/R/files/Data_4-18-2017")

# 	"/home/mhunt/R/files/Data_4-18-2017/4-18-2017_all-mapped_reads_barley_32-48_HAI_unique_countFile_correctOrderForR.csv"

barley_data1 <- read.csv("/home/mhunt/R/files/Data_4-18-2017/4-18-2017_all-mapped_reads_barley_32-48_HAI_unique_countFile_correctOrderForR.csv", header = TRUE, row.names=1)
head(barley_data1)
str(barley_data1)

barley_data1[barley_data1 == 0] <- 1


trans_data <- log2(barley_data1+1)
head(trans_data)
str(trans_data)

source("https://bioconductor.org/biocLite.R")
biocLite("edgeR")
library(edgeR)

norm_trans_data <- calcNormFactors(trans_data,method="upperquartile")
head(norm_trans_data)

write.csv(norm_trans_data, file="4-19-2017_normalization_factors_all-mapped_reads_barley_32-48_HAI.csv")
write.csv(trans_data, file="4-18-2017_log_transformed_all-mapped_reads_barley_32-48_HAI.csv")

