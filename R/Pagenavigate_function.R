# Navigate to a concrete page 
navigate_to_page <- function(page_number) {
  page_number_str <- paste0("Page$", page_number)
  xpath <- sprintf("//a[contains(@href, '%s')]", page_number_str)
  
  link_element <- remDr$findElement(using = "xpath", value = xpath)
  link_element$clickElement()
}

navigate_to_page