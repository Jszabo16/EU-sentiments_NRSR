# Read Me

In spite of the National Council of the Slovak Republic (NCSR) providing a relatively rich corpus of textual data from the parliamentary sessions 1994-2023, no previous work was done to collect, clean and process these transcripts into a compact dataset and analyze them. Focusing on 8 parliamentary terms of the NCSR: 1st (1994-1998), 2nd (1998-2002), 3rd (2002-2006), 4th (2006-2010), 5th (2010-2012), 6th (2012-2016), 7th (2016-2020) and 8th (2020-2023), I webscrape the available transcripts of the parliamentary debates from these 8 parliamentary terms from the NCSR webpage, process them and assign missing party affiliations to each speaker. After compiling all the processed data from the 8 parliamentary terms together into one dataset consisting of over 420 000 unique speaches. Subsequently, a structural topic model is ran to analyze underlying topic patterns on a subset of data containing references to the EU (approximately 10% of the dataset).  

This repository provides: 

(1) R script and necessary functions to webscrape "new" transcripts of the parliamentary debates in the NCSR (5th-8th parliamentary term, 2010-2023) out of dynamic htlm content - `Scrapping_data_new.R`,

(2) R script to webscrape "old" transcripts of the parliamentary debates in the NCSR (3rd-4th parliamentary term, 2002-2010) out of authorized transcripts from downloadable docx. documents,

(3) R script to webscrape "old" transcripts of the parliamentary debates in the NCSR (1st-2nd parliamentary term, 1994-2002) out of the digital archives of the joint Czech-Slovak parliamentary library,

(4) R script to webscrape names and party affiliation of the MPs from the NCSR webpage - `MPs_names.R`, 

(5) RData containing processed transcripts for the 8 parliamentary terms in the NCSR (1994-2023), 

(6) R script to analyze the collected corpus of the parliamentary debates in the NCSR (1994-2023) employing structural topic modelling, 

(7) RData containing webscrapped names and party affiliation of the MPs for the 8 parliamentary terms in the NCSR (1994-2023) and 

(8) Ready-to-knit Rmd file describing methodology, data manipulation and analysis of the parliamentary debates in the NCSR (1994-2023).  


# Further Information 

This is still a work in progress. It is thus at a stage where all comments are very welcome. You can get in touch with me on jakub.szabo@uniba.sk 
