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
# On suppose que tout les éléments d'un vecteur numérique sont ordonnés du plus petit au plus grand.
# On veut sélectionner seulement les éléments inférieurs ou égaux à 20 en utilisant break.


 
break_function <- function(x){
  res <- c()
  for (i in x){
    if (i>20)
      break
    res <- c(res, i) # Ce code sert à ajouter un élément à un vecteur déjà existant.
  }
  res
}


