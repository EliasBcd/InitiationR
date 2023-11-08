# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
      # AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.

test_perimetre <- function(){
  try({
    t1 <- identical(perimetre(4), 4 * 2 * pi)
    t2 <- identical(perimetre(0), 0)
    t3 <- identical(perimetre(7), 7 * 2 * pi)
    ok <- all(t1, t2, t3)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_etendue <- function(){
  v1 <- c(18, 35, 21, 40)
  v2 <- runif(10, 1, 30)
  v3 <- seq(0, 10)
  try({
    t1 <- identical(etendue(v1), max(v1) - min(v1))
    t2 <- identical(etendue(v2), max(v2) - min(v2))
    t3 <- identical(etendue(v3), max(v3) - min(v3))
    ok <- all(t1, t2, t3)   
  },
  silent = TRUE
  )
  exists('ok') && isTRUE(ok)
}

match_call <- function(correct_call = NULL) {
  e <- get("e", parent.frame())
  # Trivial case
  if(is.null(correct_call)) return(TRUE)
  # Get full correct call
  full_correct_call <- expand_call(correct_call)  
  # Expand user's expression
  expr <- deparse(e$expr)
  full_user_expr <- expand_call(expr)
  # Compare function calls with full arg names
  identical(full_correct_call, full_user_expr)
}

# Utility function for match_call answer test
# Fills out a function call with full argument names
expand_call <- function(call_string) {
  # Quote expression
  qcall <- parse(text=call_string)[[1]]
  # If expression is not greater than length 1...
  if(length(qcall) <= 1) return(qcall)
  # See if it's an assignment
  is_assign <- is(qcall, "<-")
  # If assignment, process righthandside
  if(is_assign) {
    # Get righthand side
    rhs <- qcall[[3]]
    # If righthand side is not a call, can't use match.fun()
    if(!is.call(rhs)) return(qcall)
    # Get function from function name
    fun <- match.fun(rhs[[1]])
    # match.call() does not support primitive functions
    if(is.primitive(fun)) return(qcall)
    # Get expanded call
    full_rhs <- match.call(fun, rhs)
    # Full call
    qcall[[3]] <- full_rhs
  } else { # If not assignment, process whole thing
    # Get function from function name
    fun <- match.fun(qcall[[1]])
    # match.call() does not support primitive functions
    if(is.primitive(fun)) return(qcall)
    # Full call
    qcall <- match.call(fun, qcall)
  } 
  # Return expanded function call
  qcall
}

test_alea <- function(){
  set.seed(0)
  v1 <- runif(10)
  set.seed(0)
  v1_bis <- alea(10)
  set.seed(45)
  v2 <- runif(5)
  set.seed(45)
  v2_bis <- alea(5)
  
  try({
    t1 <- identical(alea(0), numeric(0))
    t2 <- identical(v1, v1_bis)
    t3 <- identical(v2, v2_bis)
    ok <- all(t1, t2, t3)   
  },
  silent = TRUE
  )
  exists('ok') && isTRUE(ok)
}

test_alea2 <- function(){
  set.seed(0)
  v1 <- runif(10, 0, 10)
  set.seed(0)
  v1_bis <- alea(10, 0, 10)
  set.seed(45)
  v2 <- runif(5, 10, 20)
  set.seed(45)
  v2_bis <- alea(5, 10, 20)
  
  try({
    t1 <- identical(alea(0, 0, 10), numeric(0))
    t2 <- identical(v1, v1_bis)
    t3 <- identical(v2, v2_bis)
    t4 <- identical(alea(10, 0, 0), runif(10, 0, 0))
    ok <- all(t1, t2, t3, t4)   
  },
  silent = TRUE
  )
  exists('ok') && isTRUE(ok)
}

test_alea3 <- function(){
  set.seed(0)
  v1 <- trunc(runif(10, 0, 10 + 1))
  set.seed(0)
  v1_bis <- trunc(alea(10, 0, 10))
  set.seed(45)
  v2 <- trunc(runif(5, 10, 20 + 1))
  set.seed(45)
  v2_bis <- trunc(alea(5, 10, 20))
  
  try({
    t1 <- identical(alea(0, 0, 10), numeric(0))
    t2 <- identical(v1, v1_bis)
    t3 <- identical(v2, v2_bis)
    t4 <- identical(alea(10, 0, -1), runif(10, 0, 0))
    ok <- all(t1, t2, t3, t4)   
  },
  silent = TRUE
  )
  exists('ok') && isTRUE(ok)
}

test_meteo <- function(){
  meteo_correct <- function(ville){
    out <- readLines(paste0("https://v2.wttr.in/", ville, "?A"))
    cat(out, sep = "\n")
  }
  try({
    t1 <- identical(meteo("Lyon"), meteo_correct("Lyon"))
    t2 <- identical(meteo("Saint-Denis"), meteo_correct("Saint-Denis"))
    ok <- all(t1, t2)   
  },
  silent = TRUE
  )
  exists('ok') && isTRUE(ok)
}

## --------------

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
  saved <- "Exercice_3.txt"
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
