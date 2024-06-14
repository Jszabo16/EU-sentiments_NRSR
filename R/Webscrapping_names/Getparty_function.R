get_party <- function(links) {
  
  all_extracted_party <- list()
  all_urls <- list()
  
for(url in links){
  
  transcript_page  <-  read_html(paste0("https://www.nrsr.sk/web/",url))
  
  party <- transcript_page %>% 
    html_nodes("div.grid_8.alpha.omega") %>% 
    html_text() %>% 
    str_remove_all("\r\n") %>% 
    str_squish() %>% 
    keep(~ str_starts(.x,"Kandidoval")) %>%
    str_remove("^.{17}")
  
  all_extracted_party <- c(all_extracted_party, party)
  all_urls <- c(all_urls, url)
  
}
  
  party_names <- data.frame(all_extracted_party = unlist(all_extracted_party), 
                            all_urls = unlist(all_urls),
                             stringsAsFactors = FALSE)
  
  return(party_names)
}
