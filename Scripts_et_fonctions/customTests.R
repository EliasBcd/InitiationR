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
    t1 <- (tailles == tailles_corr)
    t2 <- (poids == poids_corr)
    t3 <- (imc == imc_corr)
    ok <- all(t1, t2, t3)
    }, 
  silent = TRUE
  )
  
  # Returned as the result of the answer test.
  exists('ok') && isTRUE(ok)
}