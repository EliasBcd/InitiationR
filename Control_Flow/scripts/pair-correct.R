# for (i in 1:10) {
#   if (i < 3) 
#     next
#   
#   print(i)
#   
#   if (i >= 5)
#     break
# }
# 
# Voici un exemple d'utilisation de next et break.
# next dira à R de passer à l'itération suivante dès que i est plus petit que 3, 
# de sorte que 1 et 2 ne seront pas affiché par print().
# break dit à R d'arrêter l'itération dès que i atteint la valeur 5, mais après 
# avoir affiché la valeur 5.
# 
# Essayez de faire une boucle où R ne conserve que les valeurs paires d'un 
# vecteur x.
#
# Conseil #1 : L'opérateur qui donne le reste dans la division euclidienne d'un nombre est %%.

pair <- function(x){
  res <- c()
  for (i in x){
    if (i %% 2 == 1)
      next
    res <- c(res, i)
  }
  res
}

