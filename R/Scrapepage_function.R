# Since the `Getlastpagenum_function.R` returns the page back to the first page, this function webscrappes the content of the first page 
scrape_first_page <- function(){
  page_source <- remDr$getPageSource()[[1]]
  result <- webscrape(page_source)
  return(result)
}

# Function webscrapping the content of a specific page based on the page number 
scrape_page <- function(page_number) {
  navigate_to_page(page_number)
  Sys.sleep(3)  # Wait for the page to load
  page_source <- remDr$getPageSource()[[1]]
  result <- webscrape(page_source)
  return(result)
}

