######################################
# Load Libraries & Necessary functions 
library(tidyverse)
library(RSelenium)
library(netstat)
library(rvest)
library(robotstxt)
library(readr)
source("Scrapepage_function.R")
source("Pagenavigate_function.R")
source("Getlastpagenum_function.R")
source("Gettranscript_function.R")
source("Webscrapping_function.R")
######################################

# Checking whether the information in the webpage is even accessible
paths_allowed("www.nrsr.sk")

# Start the RSelenium server
rs_driver_object <- rsDriver(browser = "chrome", # choose a browser 
                             chromever = "latest", # sets version of Chrome driver (default = "latest") # binman::list_versions("chromedriver") 
                             verbose = FALSE,
                             port = free_port()) # checking whether a port is free

# Selecting only the client from the rsDriver object 
remDr <- rs_driver_object$client 
remDr$open()
remDr$maxWindowSize()

# Navigate to the website of the National Council of the Slovak Republic 
remDr$navigate("https://www.nrsr.sk/web/default.aspx?sid=schodze%2frozprava")

# Select a parliamentary term  
# nth-child(1) -> 9th parliamentary term (2023-) 
# nth-child(2) -> 8th parliamentary term (2020-2023)
# nth-child(3) -> 7th parliamentary term (2016-2020)
# nth-child(4) -> 6th parliamentary term (2012-2016)
# nth-child(5) -> 5th parliamentary term (2010-2012)
element_session <- remDr$findElement(using = "css selector", value = "select[id='_sectionLayoutContainer_ctl01__termNr'] option:nth-child(5)")
element_session$clickElement()

# Click the search button to redirect to the selected parliamentary term 
element_session2 <- remDr$findElement(using = "id", value = "_sectionLayoutContainer_ctl01__search")
element_session2$clickElement()

# Get the page number of the last page and return back
# Needed for the loop which iterates the webscrapping process through each page in the pagination 
last_page <- "Last"
first_page <- "First"
last_page_number <- get_last_page_num(last_page, first_page)

# Webscrapping the result into one table 
scrape_all_pages <- function(){
  all_results <- tibble() 
  
  first_page_result <- scrape_first_page()
  all_results <- bind_rows(all_results, first_page_result)
  
  for (page_number in 2:last_page_number) { 
    result <- scrape_page(page_number)
    all_results <- bind_rows(all_results, result)
  }
  
  return(all_results)
}

all_results <- scrape_all_pages()

# Exporting the transcripts to csv
write_excel_csv(all_results, "num_term.csv") # replace num with the parliamentary tern number 
save(all_results, file = "num_term.RData") # replace num with the parliamentary tern number 

# Finishing the session
remDr$quit()
remDr$closeServer()
rm(remDr, rs_driver_object)
system("taskkill /im java.exe /f")