# Necessary libraries and functions 
library(tidyverse)
library(RSelenium)
library(netstat)
library(rvest)
source("Getparty_function.R")

# Start the RSelenium server
rs_driver_object <- rsDriver(browser = "chrome", # choose a browser 
                             chromever = "latest", # sets version of Chrome driver (default = "latest")
                             # if needed, check for chromedriver version: binman::list_versions("chromedriver") 
                             verbose = FALSE,
                             port = free_port()) # checking whether a port is free 

# Selecting only client out of the rsDriver object 
remDr <- rs_driver_object$client 
remDr$open()
remDr$maxWindowSize()

# Navigate to NCSR website containing the list of all MPs  
# www.nrsr.sk and then: Poslanci -> Zoznam poslancov 
remDr$navigate("https://www.nrsr.sk/web/Default.aspx?sid=poslanci/zoznam_abc")

# Select the parliamentary term in the roll-out window 
# nth-child(2) -> 8th parliamentary term (2020-2023)
# nth-child(3) -> 7th parliamentary term (2016-2020)
# nth-child(4) -> 6th parliamentary term (2012-2016)
# nth-child(5) -> 5th parliamentary term (2010-2012)
# nth-child(6) -> 4th parliamentary term (2006-2010)
# nth-child(7) -> 3th parliamentary term (2002-2006)
element_session <- remDr$findElement(using = "css selector", value = "#_sectionLayoutContainer_ctl01__currentTerm option:nth-child(2)")
element_session$clickElement()

# Click the search button to redirect to the selected parliamentary term 
element_session2 <- remDr$findElement(using = "id", value = "_sectionLayoutContainer_ctl01_ctlShow")
element_session2$clickElement()

# Get page source
page_source <- remDr$getPageSource()[[1]]

# Webscraping information (names, url to the personal site of each speaker and party affiliation) 
# Note the party affiliation corresponds to the party on which ballot the speaker was elected into the NRSR 
webscrape_names <- function(page_source) {
  page <- read_html(page_source)
  
  names <- page %>%
    html_nodes("div.mps_list") %>% 
    html_nodes("li") %>% 
    html_text()
  
  link <-  page %>%
    html_nodes("div.mps_list") %>% 
    html_nodes("li a") %>% 
    html_attr("href")
  
  party_name <- get_party(link)
  
  output <- tibble(
    names = names,
    link = link,
    party_name = party_name$all_extracted_party
  )
  
  return(output)
}

names <- webscrape_names(page_source)

# Exporting the data into RData 
save(names, file = "num_term_names.RData") # replace num with the number for the parliamentary term 


# Finishing the session
remDr$quit()
remDr$closeServer()
rm(remDr, rs_driver_object)
system("taskkill /im java.exe /f")
unique(all_results$session)







