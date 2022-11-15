# Vous pouvez implémenter la fonction my_mean comme vous le voulez, tant que
# le résultat obtenu est bien la moyenne de tous les nombres présents dans 
# 'my_vector'.
#
# Conseil #1 : sum() retourne comme résultat la somme de tous les éléments d'un
#   vecteur.
# 	Ex : sum(c(1, 2, 3)) a pour résultat 6.
#
# Conseil #2 : length() a pour résultat la longueur d'un vecteur (son nombre d'éléments).
# 	Ex : length(c(1, 2, 3)) a pour résultat 3.
#
# Conseil #3 : La moyenne de tous les nombre d'un vecteur est égal à la somme
#   de tous les éléments du vecteur divisé par le nombre d'éléments dans ce vecteur.
#
# Pour ceux qui se pensent très intelligents : n'utilisez pas la fonction mean(),
# on essaie de vous expliquer quelque chose...
#
# Sauvegardez bien ce script avant de taper submit() dans la console.


my_mean <- function(my_vector) {
  sum(my_vector)/length(my_vector)
}
