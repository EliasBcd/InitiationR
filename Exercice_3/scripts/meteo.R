# Écrire une fonction nommée meteo qui prend un argument nommé ville avec le corps.
# Tapez submit() dans la console une fois que vous avez écrit la fonction et sauvegardé le script.


# Il faut écrire des choses ici (pour définir la fonction)
  out <- readLines(paste0("https://v2.wttr.in/", ville, "?A"))
  cat(out, sep = "\n")
# Et ici pour bien la finir.