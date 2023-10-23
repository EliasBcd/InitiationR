# Écrire une fonction gel qui prend un argument nommé temperature et effectue les actions suivantes :
#   
#   - si temperature est négative, affiche le message “ça gèle” avec la fonction message()
#   - sinon, affiche le message “ça gèle pas” avec la fonction message()
#
# Tapez submit() dans la console après avoir enregistré le script une fois que vous avez fini


gel <- function(temperature) {
  if (temperature <= 0) {
    return("ça gèle")
  } else {
    return("ça gèle pas")
  }
}