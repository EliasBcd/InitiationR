# Put custom tests in this file.
      
      # Uncommenting the following line of code will disable
      # auto-detection of new variables and thus prevent swirl from
      # executing every command twice, which can slow things down.
      
      # AUTO_DETECT_NEWVAR <- FALSE
      
      # However, this means that you should detect user-created
      # variables when appropriate. The answer test, creates_new_var()
      # can be used for for the purpose, but it also re-evaluates the
      # expression which the user entered, so care must be taken.

test_gel <- function(){
  gel_correct <- function(temperature) {
    if (temperature <= 0) {
      return("ça gèle")
    } else {
      return("ça gèle pas")
    }
  }
  try({
    t1 <- identical(gel(4), gel_correct(4))
    t2 <- identical(gel(4), gel_correct(12))
    t3 <- identical(gel(-4), gel_correct(-124))
    t4 <- !identical(gel(-4), gel_correct(124))
    ok <- all(t1, t2, t3, t4)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}


test_meteo <- function(){
  meteo_correct <- function(temperature) {
    if (temperature < 0) {
      return("ça caille")
    } else if (temperature < 15) {
      return("fais pas chaud")
    } else if (temperature < 30) {
      return("on est pas mal")
    } else {
      return("tous à Miribel")
    }
  }
  try({
    t1 <- identical(meteo(4), meteo_correct(4))
    t2 <- !identical(meteo(4), meteo_correct(20))
    t3 <- identical(meteo(-4), meteo_correct(-124))
    t4 <- !identical(meteo(-4), meteo_correct(24))
    t5 <- identical(meteo(32), meteo_correct(45))
    ok <- all(t1, t2, t3, t4, t5)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_avertissement <- function(){
  avertissement_correct <- function(pluie, parapluie) {
    if (pluie && !parapluie) {
      return("mouillé")
    }
    if (pluie && parapluie) {
      return("bien vu")
    }
    if (!pluie) {
      return("RAS")
    }
  }
  try({
    t1 <- identical(avertissement(TRUE, TRUE), avertissement_correct(TRUE, TRUE))
    t2 <- identical(avertissement(TRUE, FALSE), avertissement_correct(TRUE, FALSE))
    t3 <- identical(avertissement(FALSE, TRUE), avertissement_correct(F, T))
    t4 <- identical(avertissement(F, F), avertissement_correct(F, F))
    ok <- all(t1, t2, t3, t4)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_moyenne <- function(){
  moyenne_correct <-  function(x, decimales = NULL) {
    moyenne <- mean(x)
    if (!is.null(decimales)) {
      moyenne <- round(moyenne, decimales)
    }
    moyenne
  }
  vec <- runif(10)
  try({
    t1 <- identical(moyenne_arrondie(1:10), moyenne_correct(1:10))
    t2 <- identical(moyenne_arrondie(1:10, 0), moyenne_correct(1:10, 0))
    t3 <- identical(moyenne_arrondie(vec), moyenne_correct(vec))
    t4 <- identical(moyenne_arrondie(vec, 2), moyenne_correct(vec, 2))
    ok <- all(t1, t2, t3, t4)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_etendue <- function(){
  etendue_correct <- function(x) {
    if (!is.numeric(x)) {
      warning("x doit être numérique")
      return(NA)
    }
    max(x) - min(x)
  }
  vec <- runif(10)
  try({
    t1 <- identical(etendue(1:10), etendue_correct(1:10))
    t2 <- identical(etendue(c("A", "B")), etendue_correct("A"))
    t3 <- identical(etendue(vec), etendue_correct(vec))
    ok <- all(t1, t2, t3)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_proportion <- function(){
  proportion_correct <- function(x) {
    if (sum(x) == 0) {
      stop("la somme des éléments de x vaut zéro")
    }
    x / sum(x)
  }
  vec <- runif(10)
  try({
    t1 <- identical(proportion(1:10), proportion_correct(1:10))
    t2 <- identical(proportion(vec), proportion_correct(vec))
    ok <- all(t1, t2)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}


test_somme <- function(){
  somme_correct <- function(x) {
    somme <- 0
    for (item in x) {
      if (item > 0) {
        somme <- somme + item
      }
    }
    somme
  }
  vec <- runif(10, -5, 5)
  try({
    t1 <- identical(somme_positifs(1:10), somme_correct(1:10))
    t2 <- identical(somme_positifs(vec), somme_correct(vec))
    t3 <- identical(somme_positifs(-10:5), somme_correct(-100:5))
    ok <- all(t1, t2, t3)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_somme_premiers <- function(){
  somme_correct <- function(x) {
    somme <- 0
    for (item in x) {
      if (item < 0) {
        break
      }
      somme <- somme + item
    }
    somme
  }
  vec <- runif(10, -5, 5)
  vec2 <- runif(10, -3, 10)
  
  try({
    t1 <- identical(somme_premiers_positifs(1:10), somme_correct(1:10))
    t2 <- identical(somme_premiers_positifs(vec), somme_correct(vec))
    t3 <- identical(somme_premiers_positifs(-10:5), somme_correct(-100:5))
    t4 <- identical(somme_premiers_positifs(vec2), somme_correct(vec2))
    ok <- all(t1, t2, t3, t4)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

test_pile_ou_face <- function(){
  pile_ou_face_correct <- function(n) {
    tirages <- character()
    for (i in seq_len(n)) {
      alea <- runif(1)
      if (alea < 0.5) {
        tirages <- c(tirages, "pile")
      } else {
        tirages <- c(tirages, "face")
      }
    }
    tirages
  }

  
  try({
    set.seed(0)
    r1 <- pile_ou_face(10)
    set.seed(0)
    r1_corr <- pile_ou_face_correct(10)
    set.seed(100)
    r2 <- pile_ou_face(1)
    set.seed(100)
    r2_corr <- pile_ou_face_correct(1)
    t1 <- identical(r1, r1_corr)
    t2 <- identical(r2, r2_corr)
    ok <- all(t1, t2)   
  },
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}

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
  saved <- "Exercice_4.txt"
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