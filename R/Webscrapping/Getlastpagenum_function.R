# Get the page number of the last page and return back to the first one
# Needed for the loop which iterates the webscrapping process though each page until the last one 
get_last_page_num <- function(last_page, first_page) {
  page_number_str <- paste0("Page$", last_page)
  xpath <- sprintf("//a[contains(@href, '%s')]", page_number_str)
  link_element <- remDr$findElement(using = "xpath", value = xpath)
  link_element$clickElement()
  Sys.sleep(5)
  span_element <- remDr$findElement(using = "css selector", value = "#_sectionLayoutContainer_ctl01__newDebate > tbody > tr:nth-child(1) > td > table > tbody > tr > td:nth-child(12) > span")  
  span_text <- span_element$getElementText()[[1]]
  last_page_num <- as.numeric(span_text)

  first <- paste0("Page$", first_page)
  xpath <- sprintf("//a[contains(@href, '%s')]", first)
  link_element <- remDr$findElement(using = "xpath", value = xpath)
  link_element$clickElement()
  
  return(last_page_num)
}
