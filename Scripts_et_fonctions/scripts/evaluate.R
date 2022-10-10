# Vous pouvez utilisez des fonctions comme arguments d'une autre fonction tout
# comme vous le faites pour des données. Imaginons que vous définissez les fonctions
# suivantes :
#
# ajouter_deux_nombres <- function(num1, num2){
#    num1 + num2
# }
#
# multiplier_deux_nombres <- function(num1, num2){
#	num1 * num2
# }
#
# une_fonction <- function(fonc){
#    fonc(2, 4)
# }
# 
# On utilise le nom d'argument "fonc" comme une fonction au sen de la fonction
# "une_fonction()". En utilisant les fonctions comme des arguments, on obtiendra
# que une_fonction(ajouter_deux_nombres) donnera comme résultat 6, alors que 
# une_fonction(multiplier_deux_nombres) donnera comme résultat 8.
# 
# Finissez la fonction définie ci-dessous de telle manière que si une fonction 
# est utilisé dans l'argument "fonc" et des données dans l'argument "data" (un 
# vecteur par exemple), la fonction evaluate() retournera comme résultat le 
# résultat de la fonction "fonc" sur les données "data".
#
# Quelques conseils : Cette exercice est peut-être un peu difficile.
# Voici quels résultats la fonction evaluate() devrait donner dans ces situations :
#    1. evaluate(sum, c(2, 4, 6)) a pour résultat 12
#    2. evaluate(median, c(7, 40, 9)) a pour résultat 9
#    3. evaluate(floor, 11.1) a pour résultat 11

evaluate <- function(func, dat){
  # Ecrivez votre résultat ici.
  # Rappelez vous que votre dernier ligne est automatiquement retournée. 
}
