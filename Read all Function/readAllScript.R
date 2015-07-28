Location <- "C:\\Users\\Jonathan\\Documents\\GitHub\\AnalyicsData\\Stine&Foster\\Data by Format\\Text\\04_4m_exec_comp_2010.txt"

Location2 <- file.choose()


readFile <- function(fileLocation, dlm = "\t"){
  testData <- readLines(fileLocation)
  
  testData <- gsub("([[:punct:]])", "", testData)
  
  testData <- gsub(" ", "", testData)
  
  framedData <- read.table(textConnection(testData), header = TRUE, sep = dlm)
  
  return(framedData)
}

ceoData <- readFile(Location2)

readFile(Location2)
