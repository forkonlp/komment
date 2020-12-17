## code to prepare `DATASET` dataset goes here

library(presidentSpeech)

spidx <- search_speech()

usethis::use_data(spidx, overwrite = TRUE)
