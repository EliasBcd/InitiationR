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
# On veut sélectionner des éléments d'un vecteur seulement les éléments pairs, en utilisant next.
# Une partie du code a été écrite pour vous, complétez où c'est indiquer
#
# Conseil :
#   - #1 : L'opérateur qui donne le reste dans la division euclidienne d'un nombre est %%.

# Tapez submit() dans la console une fois que vous avez terminé de modifier le script.
 
pair <- function(x){
  res <- c()
  for (#Code){
    if (#code
      #code
    res <- c(res, i) # Ce code sert à ajouter un élément à un vecteur déjà existant.
  }
  res
}


