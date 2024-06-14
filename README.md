# Read Me

In spite of the National Council of the Slovak Republic (NCSR) providing a relatively rich corpus of textual data from the parliamentary sessions 2002-2023, no previous work was done to collect, clean and process these transcripts into a compact dataset and analyze them. Focusing on 6 parliamentary terms of the NCSR: 3rd (2002-2006), 4th (2006-2010), 5th (2010-2012), 6th (2012-2016), 7th (2016-2020) and 8th (2020-2023), I webscrape the available transcripts of the parliamentary debates from these 6 parliamentary terms from the NCSR webpage, process them and assign missing party affiliations to each speaker. After compiling all the processed data from the 6 parliamentary terms together into one dataset consisting of ... unique speaches, the big data is analyzed using a sentiment analysis.  

This repository provides: 

(1) R script to webscrape "new" transcripts of the parliamentary debates in the NCSR (5th-8th parliamentary term, 2010-2023) out of dynamic htlm content,

(2) R script to webscrape "old" transcripts of the parliamentary debates in the NCSR (3d-4th parliamentary term, 2002-2010) out of authorized transcripts from downloadable docx. documents,

(3) R script to webscrape names and party affiliation of the MPs from the NCSR webpage, 

(4) R script to clean and manipulate the webscrapped transcripts, 

(5) R script to analyze the collected corpus of the parliamentary debates in the NCSR (2002-2023) employing sentiment analysis, 

(5) RData containing processed transcripts for the 6 parliamentary terms in the NCSR (2002-2023), 

(6) RData containing webscrapped names and party affiliation of the MPs for the 6 parliamentary terms in the NCSR (2002-2023) and 

(7) Ready-to-knit Rmd file describing methodology, data manipulation and analysis of the parliamentary debates in the NCSR (2002-2023).  


# Further Information 

This is still a work in progress. It is thus at a stage where all comments are very welcome. You can get in touch with me on jakub.szabo@uniba.sk 
