######################################
# Load Libraries & functions 
# Functions are placed in the R folder 
library(tidyverse)
library(RSelenium) 
library(netstat) # free_port() function 
library(rvest) 
library(robotstxt) # paths_allowed() function 
library(readr) # write_excel_csv() function 
source("Scrapepage_function.R")
source("Pagenavigate_function.R")
source("Getlastpagenum_function.R")
source("Gettranscript_function.R")
source("Webscrapping_function.R")
######################################

# Checking whether the information in the NCSR webpage is even accessible
paths_allowed("www.nrsr.sk")

# Start the RSelenium server
rs_driver_object <- rsDriver(browser = "chrome", # choose a browser 
                             chromever = "latest", # sets version of Chrome driver (default = "latest")
                             # if needed, check for chromedriver version: binman::list_versions("chromedriver") 
                             verbose = FALSE,
                             port = free_port()) # checking whether a port is free 

# Selecting only the client out of the rsDriver object 
remDr <- rs_driver_object$client 
remDr$open()
remDr$maxWindowSize()

# Navigate to NCSR website containing the transcripts 
# www.nrsr.sk and then: Schôdze -> Rozprava -> Textový prepis rozpravy
remDr$navigate("https://www.nrsr.sk/web/default.aspx?sid=schodze%2frozprava")

# Select a specific parliamentary term between 2010-2023 
# Functions to webscrape the 3rd (2002-2006) and 4th (2006-2010) parliamentary term in `Scrapping_data_old.R`
# nth-child(2) -> 8th parliamentary term (2020-2023)
# nth-child(3) -> 7th parliamentary term (2016-2020)
# nth-child(4) -> 6th parliamentary term (2012-2016)
# nth-child(5) -> 5th parliamentary term (2010-2012)
element_session <- remDr$findElement(using = "css selector", value = "select[id='_sectionLayoutContainer_ctl01__termNr'] option:nth-child(2)") 
element_session$clickElement() # choosing the specified parliamentary term in the roll-up window 

# Click the search button to redirect to the selected parliamentary term 
element_session2 <- remDr$findElement(using = "id", value = "_sectionLayoutContainer_ctl01__search")
element_session2$clickElement()

# Get the page number of the last page and return back to the first one 
# Needed for the loop which iterates the webscrapping process through each page
last_page <- "Last"
first_page <- "First"
last_page_number <- get_last_page_num(last_page, first_page)

# Webscrapping the result into one table 
scrape_all_pages <- function() {
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

# Exporting the transcripts to csv and RData 
write_excel_csv(all_results, "num_term.csv") # replace num with the parliamentary tern number 
save(all_results, file = "num_term.RData") # replace num with the parliamentary tern number 

# Finishing the session
remDr$quit()
remDr$closeServer()
rm(remDr, rs_driver_object)
system("taskkill /im java.exe /f")
