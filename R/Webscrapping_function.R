# Webscraping informations per each speaker
webscrape <- function(url) {
  page <- read_html(url)
  
  session <- page %>% 
    html_nodes("tr.tab_zoznam_nonalt td:nth-child(1), tr.tab_zoznam_nalt td:nth-child(1)") %>% 
    html_text()%>% 
    str_remove_all("\r\n") %>% 
    str_squish()
  
  date <- page %>% 
    html_nodes("tr.tab_zoznam_nonalt td:nth-child(2), tr.tab_zoznam_nalt td:nth-child(2)") %>% 
    html_text() %>% 
    str_remove_all("\r\n") %>% 
    str_squish() 
  
  names <- page %>% 
    html_nodes("tr.tab_zoznam_nonalt td strong, tr.tab_zoznam_nalt td strong") %>% 
    html_text()
  
  speech_type <- page %>% 
    html_nodes("tr.tab_zoznam_nonalt td em, tr.tab_zoznam_nalt td em") %>% 
    html_text() 

  transcript <- page %>% 
    html_nodes("tr.tab_zoznam_nonalt td:nth-child(5), tr.tab_zoznam_nalt td:nth-child(5)") %>% 
    html_node("a:nth-child(3)") %>%
    html_attr("href")  
  
  transcript_text <- get_transcript(transcript)
  
  output <- tibble(
    session = session, 
    date = date, 
    names = names, 
    speech_type = speech_type,
    url_transcript = transcript, 
    text_transcript = transcript_text$text_transcript
  )
  
  return(output)
}








