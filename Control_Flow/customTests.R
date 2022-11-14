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
  mention_correcte <- function(x) {
    if (x >= 16) {
      "Très bien"
    }
    else if (x >= 14){
      "Bien"
    }
    else if (x>=12){
      "Assez bien"
    }
    else {
      ""
    }
  }
  try({
    func <- get('mention', globalenv())
    t1 <- (func(15) == mention_correcte(15))
    t2 <- (func(10) == mention_correcte(10))
    t3 <- (func(16) == mention_correcte(16))
    t4 <- (func(14) == mention_correcte(14))
    t5 <- (func(12) == mention_correcte(12))
    ok <- all(t1, t2, t3, t4, t5)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_pair <- function() {
  try({
    func <- get('pair', globalenv())
    func_correcte <- function(x) {x[x %% 2 == 0]}
    x1 <- 1:20
    x2 <- x1
    t1 <- identical(func(x1), func_correcte(x2))
    x1 <- 0:10
    x2 <- x1
    t2 <- identical(func(x1), func_correcte(x2))
    t3 <- identical(func(seq(1, 20, by=2)), NULL)
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_break <- function() {
  try({
    func <- get('break_function', globalenv())
    func_correcte <- function(x) { x[x<=20] }
    t1 <- identical(func(1:20), func_correcte(1:20))
    t2 <- identical(func(0:30), func_correcte(0:30))
    t3 <- identical(func(21:52), NULL)
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


submit_log <- function(){
  # Changer de lien et de nom pour chaque leçon
  pre_fill_link <- "https://moodle.univ-paris8.fr/mod/assign/view.php?id=271762&action=editsubmission"
  saved <- "Control_Flow.txt"
  temp <- tempfile()
  
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