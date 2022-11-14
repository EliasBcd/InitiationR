# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
      # AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.

test_imc <- function(){
  try({
    t1 <- (tailles == c(156, 164, 197, 147, 173))
    t2 <- (poids == c(45, 59, 110, 44, 88))
    t3 <- (imc == c(45, 59, 110, 44, 88)/c(1.56, 1.64, 1.97, 1.47, 1.73)^2)
    ok <- all(t1, t2, t3)   
  }, 
  silent=TRUE)

  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_func1 <- function() {
  try({
    func <- get('boring_function', globalenv())
    t1 <- identical(func(9), 9)
    t2 <- identical(func(4), 4)
    t3 <- identical(func(0), 0)
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_func2 <- function() {
  try({
    func <- get('my_mean', globalenv())
    t1 <- identical(func(9), mean(9))
    t2 <- identical(func(1:10), mean(1:10))
    t3 <- identical(func(c(-5, -2, 4, 10)), mean(c(-5, -2, 4, 10)))
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_func3 <- function() {
  try({
    func <- get('remainder', globalenv())
    t1 <- identical(func(9, 4), 9 %% 4)
    t2 <- identical(func(divisor = 5, num = 2), 2 %% 5)
    t3 <- identical(func(5), 5 %% 2)
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_func4 <- function() {
  try({
    func <- get('evaluate', globalenv())
    t1 <- identical(func(sum, c(2, 4, 7)), 13)
    t2 <- identical(func(median, c(9, 200, 100)), 100)
    t3 <- identical(func(floor, 12.1), 12)
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_func5 <- function() {
  try({
    func <- get('telegram', globalenv())
    t1 <- identical(func("Good", "morning"), "START Good morning STOP")
    t2 <- identical(func("hello", "there", "sir"), "START hello there sir STOP")
    t3 <- identical(func(), "START STOP")
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_func6 <- function() {
  try({
    func <- get('manif', globalenv())
    t1 <- identical(func(place = "Baltimore", adjective = "puant.e.s", noun = "statue de Roger Peng"), "Nouvelles de Baltimore aujourd'hui, des étudiant.e.s puant.e.s ont fait grève contre les nouveaux statue de Roger Peng installés dans l'université.")
    t2 <- identical(func(place = "Washington", adjective = "en colère", noun = "kebabs"), "Nouvelles de Washington aujourd'hui, des étudiant.e.s en colère ont fait grève contre les nouveaux kebabs installés dans l'université.")
    ok <- all(t1, t2)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}



# test_func7 <- function() {
#   try({
#     func <- get('%p%', globalenv())
#     t1 <- identical(func("Good", "job!"), "Good job!")
#     t2 <- identical(func("one", func("two", "three")), "one two three")
#     ok <- all(t1, t2)
#   }, silent = TRUE)
#   exists('ok') && isTRUE(ok)
# }

test_eval1 <- function(){
  try({
    e <- get("e", parent.frame())
    expr <- e$expr
    t1 <- identical(expr[[3]], 6)
    expr[[3]] <- 7
    t2 <- identical(eval(expr), 8)
    ok <- all(t1, t2)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_eval2 <- function(){
  try({
    e <- get("e", parent.frame())
    expr <- e$expr
    t1 <- identical(expr[[3]], quote(c(8, 4, 0)))
    t2 <- identical(expr[[1]], quote(evaluate))
    expr[[3]] <- c(5, 6)
    t3 <- identical(eval(expr), 5)
    ok <- all(t1, t2, t3)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_eval3 <- function(){
  try({
    e <- get("e", parent.frame())
    expr <- e$expr
    t1 <- identical(expr[[3]], quote(c(8, 4, 0)))
    t2 <- identical(expr[[1]], quote(evaluate))
    expr[[3]] <- c(5, 6)
    t3 <- identical(eval(expr), 6)
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
  saved <- "Scripts_et_fonctions.txt"
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
