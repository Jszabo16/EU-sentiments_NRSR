# Function that navigates to any page based on the page number 
# Only works in my specific loop that iterates through each page one by one 
# As the pagination is dynamic, it shows buttons redirecting to the first and last page and only ten pages at once. 
# Thus, for instance, choosing page_number 1250 whilst being at page 25 would end in error since the attribute "a href" with javascript::..., `Page$1250` is not definied in the td class at page number 25 within this particular dynamic content

navigate_to_page <- function(page_number) {
  page_number_str <- paste0("Page$", page_number)
  xpath <- sprintf("//a[contains(@href, '%s')]", page_number_str)
  
  link_element <- remDr$findElement(using = "xpath", value = xpath)
  link_element$clickElement()
}

