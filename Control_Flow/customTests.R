# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
      # AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.

test_mention <- function() {
  source("Control_Flow/scripts/mention-correct.R")
  try({
    func <- get('mention', globalenv())
    t1 <- (func(15) == mention_correct(15))
    t2 <- (func(10) == mention_correct(10))
    t3 <- (func(16) == mention_correct(16))
    t4 <- (func(14) == mention_correct(14))
    t5 <- (func(12) == mention_correct(12))
    ok <- all(t1, t2, t3, t4, t5)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_pair <- function() {
  try({
    func <- get('pair', globalenv())
    source("Control_Flow/scripts/pair-correct.R")
    func_correct <- get('pair', globalenv())
    t1 <- identical(func(1:20), func_correct(1:20))
    t2 <- identical(func(0:10), func_correct(0:10))
    t3 <- identical(func(seq(1, 20, by=2)), NULL)
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_break <- function() {
  try({
    func <- get('break_function', globalenv())
    source("Control_Flow/scripts/break-correct.R")
    func_correct <- get('break_function', globalenv())
    t1 <- identical(func(1:20), func_correct(1:20))
    t2 <- identical(func(0:30), func_correct(0:30))
    t3 <- identical(func(21:52), func_correct(21:52))
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

#### Notification to teacher.
# Get the swirl state
getState <- function(){
  # Whenever swirl is running, its callback is at the top of its call stack.
  # Swirl's state, named e, is stored in the environment of the callback.
  environment(sys.function(1))$e
}

# Retrieve the log from swirl's state
getLog <- function(){
  getState()$log
}

# Get the value which a user either entered directly or was computed
# by the command he or she entered.
getVal <- function(){
  getState()$val
}

# Make sure the base64enc package is available.
install_packages <- function(packages=c("base64enc")){
  install.packages(setdiff(packages, rownames(installed.packages())))  
}


submit_log <- function(){
  # Changer de lien et de nom pour chaque leçon
  pre_fill_link <- "https://moodle.univ-paris8.fr/mod/assign/view.php?id=271762&action=editsubmission"
  saved <- "Control_Flow.txt"
  temp <- tempfile()
  install_packages()
  
  
  p <- function(x, p, f, l = length(x)){if(l < p){x <- c(x, rep(f, p - l))};x}
  
  log_ <- getLog()
  nrow_ <- max(unlist(lapply(log_, length)))
  log_tbl <- data.frame(user = rep(log_$user, nrow_),
                        course_name = rep(log_$course_name, nrow_),
                        lesson_name = rep(log_$lesson_name, nrow_),
                        question_number = p(log_$question_number, nrow_, NA),
                        correct = p(log_$correct, nrow_, NA),
                        attempt = p(log_$attempt, nrow_, NA),
                        skipped = p(log_$skipped, nrow_, NA),
                        datetime = p(log_$datetime, nrow_, NA),
                        stringsAsFactors = FALSE)
  write.csv(log_tbl, file = temp, row.names = FALSE)
  encoded_log <- base64enc::base64encode(temp)
  write.csv(encoded_log, file=saved, row.names = FALSE)
  if(getVal() == "Oui"){
    browseURL(pre_fill_link)
  }
}