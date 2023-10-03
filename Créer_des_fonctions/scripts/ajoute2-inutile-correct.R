# Voici une fonction très simple, et peu utile.
# Elle ajoute 2 à la valeur saisie en entrée.

# Un point important à noter : lorsque R rencontre une instruction `return()` dans une fonction, il interrompt immédiatement son exécution et "sort" de la fonction en renvoyant le résultat.
# L'instruction `x * 5` ne sera jamais exécutée car R "sort" de la fonction dès qu'il évalue le `return()` de la ligne précédente.



ajoute2 <- function(x) {
  return(x + 2)
  x * 5
}