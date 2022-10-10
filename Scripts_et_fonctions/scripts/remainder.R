# Je vais vous donner un exemple afin que vous compreniez un peu mieux le 
# fonctionnement des arguments par défaut. Je veux créer une fonction increment()
# qui, la plupart du temps, augment la valeur d'un nombre de 1. Cette fonction
# aura deux arguments, le premier, "nombre", est le nombre que je veux augmenter,
# Le second, "par" est l'incrément que je veux utiliser (l'augmentation du nombre
# d'origine autrement dit). J'ai écrit cette fonction.
#
# increment <- function(nombre, par = 1){
#     nombre + bpar
# }
#
# Si vous regardez entre les parenthèses, vous remarquerez que j'ai donné une 
# valeur à "par", et que cette valeur est 1. Cela signifie que la valeur par
# défaut de l'argument "par" est 1.
#
# Je peux maintenant utiliser la fonction increment SANS donner de valeur à "par":
# increment(5) aura pour résultat 6.
#
# Je peux toujours donner une valeur à l'argument "par". La commande increment(5, 2)
# aura pour résultat 7.
# 
# Vous allez maintenant écrire une fonction appelée "remainder". remainder()
# aura deux arguments : "num" et "divisor", et le reste est le résultat de
# la fonction. Imaginons maintenant que c'est en général le reste de la division
# par 2 qui vous intéresse, utilisez donc comme valeur par défaut pour "divisor"
# la valeur 2. Assurez-vous aussi que votre premier argument est "num" et que le
# second est "divisor".
# 
# Conseil #1 : Vous pouvez utiliser l'opérateur module %% pour trouver le reste
#   dans une division euclidienne.
#   Ex : 7 %% 4 a pour résultat 3. 
#
# N'oubliez pas d'utiliser les bonnes valeurs par défaut !
# Sauvegardez bien ce script avant de taper submit() dans la console.

remainder <- function(num, divisor) {
  
}
