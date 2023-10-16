# Code placed in this file fill be executed every time the
      # lesson is started. Any variables created here will show up in
      # the user's working directory and thus be accessible to them
      # throughout the lesson.

swirl_options(swirl_logging = TRUE)

y <- 5

library(questionr)
data(hdv2003)

df <- data.frame(
  q1 = c("1", "1", "2", "1"),
  q2 = c("1", "2", "2", "2"),
  q3 = c("2", "2", "1", "1"),
  q4 = c("1", "2", "1", "1")
)

ma_liste <- list(tailles = c(154, 175, 165, 189), poids = c(55, 80, 65, 89))