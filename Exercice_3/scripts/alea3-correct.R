# Modifiez la fonction que vous avez écrite précédemment pour qu'elle qu’elle 
# retourne un vecteur de n nombres ENTIERS aléatoires compris entre min et max 
# en appliquant la fonction trunc() au vecteur généré par runif() 
# Tapez submit() dans la console une fois que vous avez écrit la fonction et sauvegardé le script.

alea <- function(n, min, max) {
  v <- runif(n, min, max + 1)
  v <- trunc(v)
  return(v)
}