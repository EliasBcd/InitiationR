# Créer une fonction etendue qui retourne la différence entre la plus grande et
# la plus petite valeur d’un vecteur.
# Faites en sorte qu’elle retourne NA si le vecteur passé en argument n’est pas 
# numérique et indiquez le dans la console à l'aide d'un warning (fonction warning())
# Tapez submit() dans la console après avoir enregistré le script une fois que vous avez fini

etendue <- function(x) {
  if (!is.numeric(x)) {
    warning("x doit être numérique")
    return(NA)
  }
  max(x) - min(x)
}