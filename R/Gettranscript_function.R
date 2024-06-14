# Mine text from the pop-out transcript windows 
get_transcript <- function(transcript) {
  all_extracted_text <- list()
  all_urls <- list()
  
  for(url in transcript){
    
    transcript_page  <-  read_html(url)
    
    text <- transcript_page %>% 
      html_nodes("div") %>% 
      html_text() %>% 
      str_remove_all("\r\n") %>% 
      str_squish() %>% 
      str_c(collapse = " ")
    
    all_extracted_text <- c(all_extracted_text, text)
    all_urls <- c(all_urls, url)
    
  }
  
  transcript_df <- data.frame(url_transcript = unlist(all_urls), 
                              text_transcript = unlist(all_extracted_text),
                              stringsAsFactors = FALSE)
  
  return(transcript_df)
}
