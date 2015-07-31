Location <-  "C:\\Users\\Jonathan\\Google Drive\\Stats Camp\\Stine&Foster\\Data by Chapter\\Chapter 20\\20_walmart\\20_walmart.txt"

Location2 <- file.choose()

testData <- readLines(Location2)

testData <- gsub("\\!|\\$|\\(|\\)|\\[|\\]|\\{|\\}|\\#|\\'|\\%|\\~|\\?|\\@|\\^|\\*|\\&|\\,",
                 "",
                 testData)

testData <- gsub(" ", "", testData)

framedData <- read.table(textConnection(testData), header = TRUE, sep = "\t")




readFile <- function(fileLocation, dlm = "\t"){
  testData <- readLines(fileLocation)
  
  testData <- gsub("\\!|\\$|\\(|\\)|\\[|\\]|\\{|\\}|\\#|\\'|\\%|\\~|\\?|\\@|\\^|\\*|\\&|\\,",
                   "",
                   testData)
  
  testData <- gsub(" ", "", testData)
  
  framedData <- read.table(textConnection(testData), header = TRUE, sep = dlm)
  
  return(framedData)
}

ceoData <- readFile(Location2)

readFile(Location2)
