# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

swirl_options(swirl_logging = TRUE)

library(tidyverse)
library(questionr)
data(rp2018)

rp69 <- filter(rp2018, departement %in% c("Rhône", "Loire"))