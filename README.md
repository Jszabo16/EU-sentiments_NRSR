# Read Me

In spite of the National Council of the Slovak Republic (Národná rada Slovenskej republiky, hereafter "NRSR") providing a relatively rich corpus of textual data, no previous work was done to collect, clean and process these transcripts into a compact dataset and analyze them. In this research, I webscrape the available transcripts of the NRSR parliamentary speeches for the first 8 parliamentary terms (1994-2023), process them and extend with additional information per each speech. Compiled dataset of all the 8 parliamentary terms contains over 420 000 unique speaches of MPs and government ministers with the following information:
- `Term`: number indicating parliamentary term (1 - 1994/1998, 2 - 1998/2002, 3  - 2002/2006, 4 - 2006/2010, 5 - 2010/2012, 6 - 2012/2016, 7 - 2016/2020 and 8 - 2020/2023),
- `Session`: number indicating session number within a parliamentary term,
- `Date`: date when the speech was delivered,
- `Year`: year when the speech was delivered,
- `Name`: name of the speaker who delivered the speech,
- `Age`: achieved age of the speaker in the year the speech was delivered (year of the birth - year),
- `Gender`: biological sex of the speaker (female/male),
- `Party`: party affiliation of the speaker assigned based on the party ballot on which the speaker was elected into the NRSR or, if applicable, based on the party that nominated the speaker to their position (ministerial nominees),
- `Opposition`: flag indicating whether the party is part of the coalition or opposition (opposition - 1, coalition - 0),
- `Minister`: flag indicating whether the speaker is in ministerial position, i.e. part of the government (minister - 1, non-minister/MP - 0),
- `Leader`: flag indicating whether the speaker is a party leader, i.e. chairman of the party (party leader - 1, ordinary member - 0),
- `Left_right`: party left-righ scale based on the Manifesto Project data, 
- `Conservative_liberal`: party conservative-liberal scale based on the Manifesto Project data,   
- `Transcript`: parliamentary speech delivered by the speeker. 

In the second step, this research estimates sentiments towards the European Union (hereafter "EU") on a subset of over 12,000 speeches containing some EU-related reference (e.g., European, EU, Brussels etc.). To estimate the sentiments, I rely on aspect-based sentiment analysis using BERT language model. Consequently, a structural topic model with sentiment and other meta data-related covariates is run to reveal which topics are associated with negative sentiments towards the EU.   

This repository provides: 

(1) RData and csv files (`NRSR_parl_speeches`) containing webscrapped and pre-processed parliamentary speeches with additional information per each speaker for the 8 parliamentary terms in the NRSR (1994-2023), 
(2) Python script for the aspect-based sentiment analysis using BERT language model to estimate sentiments towards the EU in the NRSR parliamentary speeches (1994-2023), 
(3) R script for the ex-post analysis of the estimated sentiments towards the EU from the NRSR parliamentary speeches (1994-2023),    
(4) R script for the estimation and description of the structural topic models with the sentiment and other meta data-related covariates, 
(5) Rmd file describing the proces of webscrapping, pre-processing, compiling and extending the `NRSR_parl_speeches` with additional information, 
(6) Rmd file wih the manuscript titled *Analyzing Sentiments towards the European Union in Slovak Parliamentary Speeches (1994–2023)* that was submitted to , 
(7) Rmd file with the accompgnying appendix to the manuscript. 


# Further Information 

This is still a work in progress. It is thus at a stage where all comments are very welcome. You can get in touch with me on jakub.szabo@uniba.sk. 
