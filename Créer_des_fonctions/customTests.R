# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
      # AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.

## Testing the function ----
test_ajoute2 <- function(){
  try({
    t1 <- (ajoute2(5) == 7)
    t2 <- (ajoute2(-1) == 1)
    ok <- all(t1, t2)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_somme <- function(){
  try({
    t1 <- (somme(2, 3) == 2 + 3)
    t2 <- (somme(4, 5) == 4 + 5)
    t3 <- (somme(8, -8) == 0)
    ok <- all(t1, t2, t3)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_miaule <- function(){
  try({
    t1 <- (miaule() == "Miaou")
    ok <- all(t1)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_prop_table <- function(){
  vec <- c("rouge", "vert", "vert", "bleu", "rouge")
  vec2 <- rep(1:4, 3)
  
  prop_tab_correct <- function(v) {
    tri <- table(v)
    effectif_total <- length(v)
    tri <- tri / effectif_total * 100
    return(tri)
  }
  
  try({
    t1 <- all(prop_tab(vec) == prop_tab_correct(vec))
    t2 <- all(prop_tab(vec2) == prop_tab_correct(vec2))
    ok <- all(t1, t2)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_prop_tab_deci <- function(){
  vec <- c("rouge", "vert", "vert", "bleu", "rouge")
  vec2 <- rep(1:4, 3)
  
  prop_tab_correct <- function(v) {
    tri <- table(v)
    effectif_total <- length(v)
    tri <- round(tri / effectif_total * 100, 1)
    return(tri)
  }
  
  try({
    t1 <- all(prop_tab(vec) == prop_tab_correct(vec))
    t2 <- all(prop_tab(vec2) == prop_tab_correct(vec2))
    ok <- all(t1, t2)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_prop_tab_deci_arg <- function(){
  vec <- c("rouge", "vert", "vert", "bleu", "rouge")
  vec2 <- rep(1:4, 3)
  
  prop_tab_correct <- function(v, decimales) {
    tri <- table(v)
    effectif_total <- length(v)
    tri <- round(tri / effectif_total * 100, decimales)
    return(tri)
  }
  
  try({
    t1 <- all(prop_tab(vec, 1) == prop_tab_correct(vec, 1))
    t2 <- all(prop_tab(vec2, 1) == prop_tab_correct(vec2, 1))
    t3 <- all(prop_tab(vec, 3) == prop_tab_correct(vec, 3))
    ok <- all(t1, t2, t3)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_indicateurs <- function(){
  TRUE
}

test_recode <- function(){
  recode_correct <- function(var) ifelse(var == "1","Oui", "Non")
  
  try({
    t1 <- all(recode_oui_non(df$q1) == recode_correct(df$q1))
    t2 <- all(recode_oui_non(df$q2) == recode_correct(df$q2))
    t3 <- all(recode_oui_non(df$q3) == recode_correct(df$q3))
    t4 <- all(recode_oui_non(df$q4) == recode_correct(df$q4))
    ok <- all(t1, t2, t3, t4)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_prop_tab_defaut <- function(){
  vec <- c("rouge", "vert", "vert", "bleu", "rouge")
  vec2 <- rep(1:4, 3)
  
  prop_tab_correct <- function(v, decimales  = 1) {
    tri <- table(v)
    effectif_total <- length(v)
    tri <- round(tri / effectif_total * 100, decimales)
    return(tri)
  }
  
  try({
    t1 <- all(prop_tab(vec) == prop_tab_correct(vec))
    t2 <- all(prop_tab(vec2) == prop_tab_correct(vec2))
    t3 <- all(prop_tab(vec, 2) == prop_tab_correct(vec, 2))
    ok <- all(t1, t2, t3)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_manif <- function() {
  try({
    func <- get('manif', globalenv())
    t1 <- identical(func(place = "Baltimore", adjective = "puant.e.s", noun = "statue de Roger Peng"), "Nouvelles de Baltimore aujourd'hui, des étudiant.e.s puant.e.s ont fait grève contre les nouveaux statue de Roger Peng installés dans l'université.")
    t2 <- identical(func(place = "Washington", adjective = "en colère", noun = "kebabs"), "Nouvelles de Washington aujourd'hui, des étudiant.e.s en colère ont fait grève contre les nouveaux kebabs installés dans l'université.")
    ok <- all(t1, t2)
  }, silent = TRUE)
  exists('ok') && isTRUE(ok)
}

test_indicateurs2 <- function(){
  vec2 <- rep(1:4, 3)
  
  indicateurs_correct <- function(v) {
    moyenne <- mean(v)
    ecart_type <- sd(v)
    c(moyenne, ecart_type)
  }
  
  try({
    t1 <- all(indicateurs(vec2) == indicateurs_correct(vec2))
    t2 <- all(indicateurs(hdv2003$age) == indicateurs_correct(hdv2003$age))
    ok <- all(t1, t2)   
  },
  silent = TRUE
  )
}

test_indicateurs3 <- function(){
  vec2 <- rep(1:4, 3)
  
  indicateurs_correct <- function(v) {
    moyenne <- mean(v)
    ecart_type <- sd(v)
    list(moyenne = moyenne, ecart_type = ecart_type)
  }
  
  try({
    t1 <- all(indicateurs(vec2) == indicateurs_correct(vec2))
    t2 <- all(indicateurs(hdv2003$age) == indicateurs_correct(hdv2003$age))
    t3 <- indicateurs(vec2)$moyenne == indicateurs_correct(vec2)$moyenne
    t4 <- indicateurs(vec2)$ecart_type == indicateurs_correct(vec2)$ecart_type
    ok <- all(t1, t2, t3, t4)   
  },
  silent = TRUE
  )
}

## Saving the progress -------
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
  saved <- "Creer_Fonctions.txt"
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
  encoded_log <- base64encode(temp)
  write.csv(encoded_log, file=saved, row.names = FALSE)
  if(getVal() == "Oui"){
    browseURL(pre_fill_link)
  }
}
