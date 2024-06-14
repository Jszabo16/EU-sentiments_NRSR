# Webscrape the content of the specific page 
scrape_page <- function(page_number) {
  navigate_to_page(page_number)
  Sys.sleep(3)  # Wait for the page to load
  page_source <- remDr$getPageSource()[[1]]
  result <- webscrape(page_source)
  return(result)
}

scrape_first_page <- function(){
  page_source <- remDr$getPageSource()[[1]]
  result <- webscrape(page_source)
  return(result)
}

